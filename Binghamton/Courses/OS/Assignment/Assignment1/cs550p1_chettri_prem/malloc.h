/*
 * This is the interface file for the malloc, free, calloc and realloc 
 * The main implemetation is present in malloc.c file
 * Call to malloc does not handle all the cases, specially merging of address
 */

#include <stdio.h>
#include "utility.h"

void *malloc(size_t size);
void free(void *ptr);
void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);
