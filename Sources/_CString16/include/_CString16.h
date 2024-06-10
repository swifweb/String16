#ifndef _CString16_h
#define _CString16_h
#pragma once
#include <stdint.h>
#include <stddef.h>


typedef uint8_t utf8_t; // The type of a single UTF-8 character
typedef uint16_t utf16_t; // The type of a single UTF-16 character

typedef enum __attribute__((enum_extensibility(closed))) {
    LengthInBytes = 0,
    LengthInCodepoints = 1
} UTF16LengthResult;

extern void ___consoleLogInt(size_t);

#endif /* _CString16_h */
