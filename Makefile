.PHONY: default clean test count list


CUR_DIR := $(shell pwd)
SOURCES:=$(shell find ./src -type f \( -name *.h -o -name *.c \) )

default:
	cd target;$(MAKE) all;cd ..;
	cd client;$(MAKE) all;cd ..;

clean:
	cd target;$(MAKE) clean;cd ..;
	cd client;$(MAKE) clean;cd ..;
	@rm -rf .db

test:
	cd test;rm -rf ./log/*;rm -rf .db;cd ..;
	@python ./test/run_test.py -p ${CUR_DIR}/test -r 1

list:
	@echo ${SOURCES}
count:
	@wc -l ${SOURCES} 

