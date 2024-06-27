// go test -v -timeout 10m
package test

import (
	"encoding/json"
	"os"
	"path/filepath"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

const base_test_dir = "./terratest/"

type Config struct {
	Tests []struct {
		TestID   string `json:"test_id"`
		TestName string `json:"test_name"`
		Folders  []struct {
			Dir string `json:"dir"`
		} `json:"folders"`
	} `json:"tests"`
}

func get_config(t *testing.T) *Config {
	t.Helper()
	var thisconfig Config
	jsonFile, _ := os.Open("./tests.json")
	jsonBytes, _ := os.ReadFile(jsonFile.Name())
	defer jsonFile.Close()
	json.Unmarshal(jsonBytes, &thisconfig)

	return &thisconfig
}

func Test_Meraki_Provider(t *testing.T) {
	setup_test()
	config := get_config(t)

	for _, test := range config.Tests {
		os.Mkdir(base_test_dir+test.TestID+"/", 0755)
		for _, folder := range test.Folders {
			CopyExampleFiles(folder.Dir, base_test_dir+test.TestID+"/")
		}
		t.Run(test.TestName, func(t *testing.T) {
			idempotent_test(t, test.TestID)
		})
	}

	teardown_test()
}

func setup_test() {
	os.Mkdir(base_test_dir, 0755)
}

func CopyExampleFiles(exampleDir, terratestDir string) {
	fileInfos, _ := os.ReadDir(exampleDir)
	for _, fileInfo := range fileInfos {
		terratestPath := filepath.Join(terratestDir, fileInfo.Name())
		examplePath := filepath.Join(exampleDir, fileInfo.Name())
		if fileInfo.IsDir() {
			CopyExampleFiles(examplePath, terratestPath)
		} else {
			input, _ := os.ReadFile(examplePath)
			os.WriteFile(terratestPath, input, 0755)
		}
	}
}

func idempotent_test(t *testing.T, test_id string) {
	terratest_dir := base_test_dir + test_id + "/"
	os.Mkdir(terratest_dir, 0755)

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: terratest_dir,
		VarFiles:     []string{"../../test.tfvars"},
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.Init(t, terraformOptions)
	terraform.ApplyAndIdempotent(t, terraformOptions)
	time.Sleep(5 * time.Second)
}

func teardown_test() {
	os.Mkdir(base_test_dir, 0755)
	os.RemoveAll(base_test_dir)
}
