SHELL=/bin/bash -euo pipefail

export PATH := .github/.bin:${PATH}

.PHONY: k3d-up
k3d-up:
	k3d cluster create openfga -p "8080:80@server:0"

.PHONY: k3d-down
k3d-down:
	k3d cluster delete openfga || true