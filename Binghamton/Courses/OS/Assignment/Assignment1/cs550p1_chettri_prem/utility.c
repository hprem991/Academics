#include "utility.h"
#include <unistd.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>



// We don't want to call any standard functions in cs550_print() in actual use,
// since those might call malloc() and cs550_print() will likely be called from
// within malloc().  However, when debugging cs550_print() itself, we won't be
// calling it from within malloc(), in which case it's fine to call assert(),
// etc.  Thus, this wil make any use of assert() in cs550_print() go away,
// unless we are actually just testing cs550_print().  In that case, define
// CS550_PRINT_DEBUG.
#ifndef CS550_PRINT_DEBUG
#define cs550_print_assert(cond) ((void) 0)
#else
#define cs550_print_assert assert
#endif

static void
error() {
    const char *const m = "\ncs550_print(): Bad format.\n";
    write(2, m, strlen(m));
}

// Convert ulong to decimal ASCII.
// dtr means digit to the right.
static char *
ultoda_helper(char *buf, unsigned long ul, int dtr) {
    if (ul > 0) {
        buf = ultoda_helper(buf, ul/10, dtr + 1);
        *buf++ = '0' + ul%10;
        // Check if need a comma.
        if (dtr%3 == 0 && dtr > 0) {
            *buf++ = ',';
        }
    }
    return buf;
}
static void
ultoda(char *buf, unsigned long ul) {
    cs550_print_assert(buf != 0);
    if (ul == 0) {
        *buf++ = '0';
    } else {
        buf = ultoda_helper(buf, ul, 0);
    }
    *buf = '\0';
}

// Convert ulong to hex ASCII.
static char hex_digit_map[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
// dtr means digit to the right.
static char *
ultoha_helper(char *buf, unsigned long ul, int dtr) {
    if (ul > 0) {
        buf = ultoha_helper(buf, ul/16, dtr + 1);
        *buf++ = hex_digit_map[ul%16];
        // Check if need a comma.  For hex, do it every 4.
        if (dtr%4 == 0 && dtr > 0) {
            *buf++ = ',';
        }
    }
    return buf;
}
static void
ultoha(char *buf, unsigned long ul) {
    cs550_print_assert(buf != 0);
    if (ul == 0) {
        *buf++ = '0';
    } else {
        buf = ultoha_helper(buf, ul, 0);
    }
    *buf = '\0';
}

// This is a tiny version of printf() that accepts only %lu, %lx, %s, and %%.
#pragma GCC diagnostic push
#ifndef __clang__
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
void
cs550_print(const char *fmt, ...) {

    enum { ST_CHUNK = 1, ST_PERCENT, ST_L } state = ST_CHUNK;
    size_t chunk_begin = 0;
    int rv;

    va_list ap;
    va_start(ap, fmt);

    size_t i = 0;
    for (; fmt[i] != '\0'; i++) {
        int ch = fmt[i];
        switch (state) {
            case ST_CHUNK:
                {
                    if (ch == '%') {
                        state = ST_PERCENT;
                        rv = write(2, &fmt[chunk_begin], i - chunk_begin);
                        cs550_print_assert((unsigned) rv == i - chunk_begin);
                    }
                }
                break;
            case ST_PERCENT:
                {
                    if (ch == 's') {
                        const char *s = va_arg(ap, const char *);
                        rv = write(2, s, strlen(s));
                        cs550_print_assert((unsigned) rv == strlen(buf));
                        chunk_begin = i + 1;
                        state = ST_CHUNK;
                    } else if (ch == 'l') {
                        state = ST_L;
                    } else if (ch == '%') {
                        chunk_begin = i;
                        state = ST_CHUNK;
                    } else {
                        error();
                    }
                }
                break;
            case ST_L:
                {
                    if (ch == 'u') {
                        unsigned long ul = va_arg(ap, unsigned long);
                        char buf[100];
                        ultoda(buf, ul);
                        rv = write(2, buf, strlen(buf));
                        cs550_print_assert((unsigned) rv == strlen(buf));
                        chunk_begin = i + 1;
                        state = ST_CHUNK;
                    } else if (ch == 'x') {
                        unsigned long ul = va_arg(ap, unsigned long);
                        char buf[100];
                        ultoha(buf, ul);
                        rv = write(2, buf, strlen(buf));
                        cs550_print_assert((unsigned) rv == strlen(buf));
                        chunk_begin = i + 1;
                        state = ST_CHUNK;
                    } else {
                        error();
                    }
                }
                break;
            default:
                cs550_print_assert(0);
                abort();
                break;
        }
    }

    if (i - chunk_begin > 0) {
        rv = write(2, &fmt[chunk_begin], i - chunk_begin);
        cs550_print_assert((unsigned) rv == i - chunk_begin);
    }

    va_end(ap);
}
#pragma GCC diagnostic pop

void
cs550_assert_fail(const char *cond, const char *file_name, const char *func_name, int line_num) {
    cs550_print("Assertion \"%s\" failed in function %s, at line %lu in file %s.\n",
     cond, func_name, (unsigned long) line_num, file_name);
    abort();
}
