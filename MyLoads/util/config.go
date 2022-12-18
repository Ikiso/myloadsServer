package util

import "github.com/spf13/viper"

type Config struct {
	BDMonolith string `mapstructure:"BD_MONOLITH"`
	BDAction   string `mapstructure:"BD_ACTION"`
	BDPayment  string `mapstructure:"BD_PAYMENT"`
	SecretKey  string `mapstructure:"SECRET_KEY"`
}

func LoadConfig(path string) (c Config, e error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")
	viper.SetConfigType("env")

	viper.AutomaticEnv()

	e = viper.ReadInConfig()
	if e != nil {
		return
	}

	e = viper.Unmarshal(&c)
	return
}
