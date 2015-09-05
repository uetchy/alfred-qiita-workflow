package main

import (
	"encoding/json"
	"github.com/spf13/viper"
	"os"
	"os/user"
	"path/filepath"
)

type config struct {
	AccessToken string `json:"accessToken"`
}

var C config

func getHomeDir() string {
	currentUser, _ := user.Current()
	return currentUser.HomeDir
}

func getDefaultConfigPath() string {
	return filepath.Join(getHomeDir(), "Library/Application Support/Alfred 2/Workflow Data/", bundleId)
}

func loadConfig() error {
	configPath := getDefaultConfigPath()
	viper.SetConfigName("config")
	viper.AddConfigPath(configPath)
	viper.SetConfigType("json")
	err := viper.ReadInConfig()
	if err != nil {
		return err
	}
	return nil
}

func saveConfig() error {
	configPath := getDefaultConfigPath()
	viper.Marshal(&C)

	buf, err := json.MarshalIndent(C, "", "    ")
	if err != nil {
		return err
	}

	err = os.MkdirAll(configPath, 0755)
	if err != nil {
		return err
	}

	f, err := os.Create(configPath + "/config.json")
	if err != nil {
		return err
	}

	defer f.Close()

	f.WriteString(string(buf))
	return nil
}
