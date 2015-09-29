/*
 * Copyright 2015 Erik Van Hamme
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <sys/stat.h>
#include <sys/types.h>

// TODO: consider supporting more chip types in this file to make this copy-able to other cubefx libs.

#ifdef STM32F4
#include "stm32f4xx.h"
#endif

#ifdef STM32F7
#include "stm32f7xx.h"
#endif

#ifndef __weak
#define __weak __attribute__((weak))
#endif

/* TODO: Find out what other NewLib syscalls should be implemented. (List: http://wiki.osdev.org/Porting_Newlib#newlib.2Flibc.2Fsys.2Fmyos.2Fsyscalls.c ) */

/* char **environ; *//* pointer to array of char * strings that define the current environment variables */
/*
__weak int _execve(char *name, char **argv, char **env);
__weak int _fork();
__weak int _link(char *oldCh, char *newCh);
__weak int _open(const char *name, int flags, ...);
__weak int _stat(const char *file, struct stat *st);
__weak clock_t _times(struct tms *buf);
__weak int _unlink(char *name);
__weak int _wait(int *status);
__weak int _gettimeofday(struct timeval *p, struct timezone *z);
*/

extern int _heap_start;
extern void abort();

__weak char __write_char(char ch) {
    return ch;
}

__weak int _close(int file) {
    (void) file;

    return 0;
}

__weak void _exit() {
}

__weak int _fstat(int file, struct stat *st) {
    (void) file;
    (void) st;

    return 0;
}

__weak int _getpid() {
    return 0;
}

__weak int _isatty(int file) {
    (void) file;

    return 0;
}

__weak int _kill(int pid, int sig) {
    (void) pid;
    (void) sig;

    return 0;
}

__weak int _lseek(int file, int ptr, int dir) {
    (void) file;
    (void) ptr;
    (void) dir;

    return 0;
}

__weak int _read(int file, char *ptr, int len) {
    (void) file;
    (void) ptr;
    (void) len;

    return 0;
}

__weak caddr_t _sbrk(int incr) {
	static unsigned char *heap_end = NULL;
	unsigned char *prev_heap;

	if (heap_end == NULL) {
		heap_end = (unsigned char *) &_heap_start;
	}
	
	unsigned char *stack_bottom = (unsigned char *) __get_MSP();
	
	if (heap_end + incr >  stack_bottom) {
		abort(); /* Heap and stack collision. */
	}
	
	prev_heap = heap_end;
	heap_end += incr;

	return (caddr_t) prev_heap;
}

__weak int _write(int file, char *ptr, int len) {
    (void) file;
    (void) ptr;

    int written = 0;

    if ((len > 0) && (ptr != 0)) {
        for (int i = 0; i < len; ++i) {
            if (__write_char(ptr[i]) == ptr[i]) {
                ++written;
            }
        }
    }

    return written;
}

/* 
 * _init() is implemented here to allow linking with -nostartfiles. Doing this avoids that the startup of the application
 * builds support for destruction of the static C++ objects. Destruction support is not needed because embedded apps should
 * never return from main().
 */
__weak void _init() {
}
