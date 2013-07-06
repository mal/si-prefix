bin = ./node_modules/.bin

coffee = $(bin)/coffee
mocha = $(bin)/mocha

test: test-int
test-all: test-unit test-int

test-unit: pretest
	$(mocha) test/unit/*.coffee

test-int: pretest
	$(mocha) test/int/*.coffee

pretest:
	npm install
	$(coffee) -co lib/ src/

.PHONY: src test test-all test-int test-unit
