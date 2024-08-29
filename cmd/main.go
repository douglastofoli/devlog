package main

import router "github.com/douglastofoli/devlog/internal/handler"

func main() {
	r := router.NewRouter()
	r.Engine.Run()
}
