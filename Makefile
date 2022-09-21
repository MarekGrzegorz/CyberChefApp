all: help

.PHONY: run_dev
run_dev:
	../../bin/wails dev

.PHONY: build_mac
build_mac: ## Build macOS Universal Binary
	../../bin/wails build --clean --platform darwin/universal -webview2 embed -obfuscate

.PHONY: bulid_mac_arm64
bulid_mac_arm64: ## Build macOS arm64 Binary
	../../bin/wails build --clean --platform darwin/arm64 -webview2 embed -obfuscate

.PHONY: bulid_mac_amd64
bulid_mac_amd64: ## Build macOS amd64 Binary
	../../bin/wails build --clean --platform darwin/amd64 -webview2 embed -obfuscate

.PHONY: build_windows
build_windows: ## Build windows binary
	../../bin/wails build --clean --platform windows -webview2 embed -obfuscate

.PHONY: build_linux
build_linux: ## Build Linux Binary
	../../bin/wails build --clean --platform linux -webview2 embed -obfuscate


help: ## Show this help
	@echo "CyberChef wails.io build options"
	@wails build --help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m make %-30s\033[0m %s\n", $$1, $$2}'

#Flag 							Details 															Default
#-clean 						Clean the bin directory before building
#-compiler 						path/to/compiler 	Use a different go compiler, eg go1.15beta1 		go
#-ldflags "custom ld flags" 	Use given ldflags
#-o path/to/binary 				Compile to given path/filename
#-k 							Keep generated assets
#-tags 							Build tags to pass to Go compiler (quoted and space separated)
#-upx 							Compress final binary with UPX (if installed)
#-upxflags "custom flags" 		Flags to pass to upx
#-v int 						Verbosity level (0 - silent, 1 - default, 2 - verbose) 					1
#-delve 						If true, runs delve on the compiled binary 								false




#Supported platforms are:
#Platform			Description
#darwin				MacOS + architecture of build machine
#darwin/amd64		MacOS 10.13+ AMD64
#darwin/arm64		MacOS 11.0+ ARM64
#darwin/universal	MacOS AMD64+ARM64 universal application
#windows			Windows 10/11 + architecture of build machine
#windows/amd64		Windows 10/11 AMD64
#windows/arm64		Windows 10/11 ARM64
#linux				Linux + architecture of build machine
#linux/amd64		Linux AMD64
#linux/arm64		Linux ARM64