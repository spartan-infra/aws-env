BASE_DIR := modules/

.PHONY: fmt
.DEFAULT_GOAL := fmt

ifeq ($(OS),Windows_NT)
DIRS := $(patsubst $(shell CHDIR )\\%,%,$(shell DIR /A:D /B /S $(BASE_DIR)))
else
DIRS := $(shell find $(BASE_DIR) -type d -not -path '*/\.*')
endif

fmt:
	for d in ${DIRS}; do terraform fmt $$d ; done