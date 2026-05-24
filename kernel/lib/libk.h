#ifndef LIBK_H
#define LIBK_H
#include <stddef.h>
#include <stdint.h>

void* memcpy(void* restrict dest, const void* restrict src, size_t n);
void* memset(void* s, int c, size_t n);
void* memmove(void* dest, const void* src, size_t n);
int   memcmp(const void* s1, const void* s2, size_t n);

size_t strlen(const char* s);
char*  strcpy(char* restrict dest, const char* restrict src);
char*  strncpy(char* restrict dest, const char* restrict src, size_t n);
int    strcmp(const char* s1, const char* s2);
int    strncmp(const char* s1, const char* s2, size_t n);
char*  strcat(char* restrict dest, const char* restrict src);
char*  strchr(const char* s, int c);
char*  strrchr(const char* s, int c);

void  itoa(int n, char* str, int base);

void  printf(const char *str);
void  putchar(char c);
#endif