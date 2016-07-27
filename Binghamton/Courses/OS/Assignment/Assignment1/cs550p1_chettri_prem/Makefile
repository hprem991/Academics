CC=gcc
CXX=g++
#CC=clang
#CXX=clang++
DEBUG=\
 -DCS550_ASSERT \
 -DCS550_DBG_PRINT \

.PHONY: a.out
a.out:
	$(CC) -O $(DEBUG) -std=c99 -D_XOPEN_SOURCE=500 -Wall -Wextra  malloc.c malloc.h utility.c
