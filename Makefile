REPORTER ?= dot

coffee = ./node_modules/.bin/coffee
mocha = ./node_modules/.bin/mocha --reporter $(REPORTER)

build:
ifndef CI
	npm install
	$(coffee) -co lib/ src/
endif

test: test-int

test-all: test-unit test-int

test-int: build
	$(mocha) test/int/*.coffee

test-unit: build
	$(mocha) test/unit/*.coffee

.PHONY: build test test-all test-int test-unit
