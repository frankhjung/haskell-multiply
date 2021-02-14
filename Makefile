#!/usr/bin/env make

.SUFFIXES:
.SUFFIXES: .o .hs

SRC	:= $(wildcard src/*.hs app/*.hs test/*.hs bench/*.hs)
TGT 	:= multiply
ROOT	:= $(shell stack path --local-doc-root)

.PHONY: default
default:check fast

.PHONY: check
check:	tags style lint

.PHONY: all
all:	check build test doc bench exec

.PHONY: tags
tags:	$(SRC)
	@echo tags ...
	@hasktags --ctags --extendedctag $(SRC)

.PHONY: style
style:	$(SRC)
	@echo style ...
	@stylish-haskell --config=.stylish-haskell.yaml --inplace $(SRC)

.PHONY: lint
lint:	$(SRC)
	@echo lint ...
	@hlint --cross --color --show $(SRC)

.PHONY: fast
fast:
	@echo fast build ...
	@stack build --fast --test

.PHONY: build
build:
	@echo build ...
	@stack build --pedantic --no-test

.PHONY: test
test:
	@echo test ...
	@stack test

.PHONY: bench
bench:
	@echo bench ...
	@stack bench multiply:bench:multiplyBench --benchmark-arguments '-o $(ROOT)/benchmark.html'

.PHONY: doc
doc:
	@echo doc ...
	@stack haddock --no-rerun-tests --no-reconfigure --haddock-deps

.PHONY: exec
exec:	$(SRC)
	@echo Multiply: 15 x 12 = 180 ...
	@stack exec multiply 15 12

.PHONY: setup
setup:
	@stack update
	@stack setup
	@stack build
	@stack query
	@stack ls dependencies
	#stack exec ghc-pkg -- list

.PHONY: clean
clean:
	@stack clean

.PHONY: cleanall
cleanall: clean
	-$(RM) -rf public dist
	-$(RM) $(TGT)
