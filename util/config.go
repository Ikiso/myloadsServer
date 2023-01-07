package util

import "github.com/spf13/viper"

type Config struct {
	BDMonolith string `mapstructure:"BD_MONOLITH"`
	BDAuction  string `mapstructure:"BD_AUCTION"`
	BDPayment  string `mapstructure:"BD_PAYMENT"`
	SecretKey  string `mapstructure:"SECRET_KEY"`
	PID        string `mapstructure:"PID"`
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
