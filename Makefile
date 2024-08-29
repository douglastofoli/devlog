PACKAGES := $(shell go list ./...)
name := $(shell basename ${PWD})

all: help

.PHONY: help
help: Makefile
	@echo
	@echo " Choose a make command to run"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## css: build tailwindcss
.PHONY: css
css:
	tailwindcss -i web/static/css/input.css -o web/static/css/output.min.css --minify

## css-watch: watch build tailwindcss
.PHONY: css-watch
css-watch:
	tailwindcss -i web/static/css/input.css -o web/static/css/output.css --watch

## css-watch: watch build tailwindcss
.PHONY: templ-watch
templ-watch:
	templ generate --watch --proxy="http://localhost:8080" --open-browser=false

## dev: run application with live reload in dev mode
.PHONY: dev
run:
	make css-watch & \
	make templ-watch & \
	go run cmd/main.go
