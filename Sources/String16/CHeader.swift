//
//  CHeader.swift
//
//
//  Created by Mihael Isaev on 15.05.2024.
//

import _CString16

#if swift(>=5.10) // FIXME: change to >=6.0
@_extern(c)
func utf8_to_utf16(
    _ utf8: UnsafePointer<UInt8>,
    _ utf8_len: Int,
    _ utf16: UnsafeMutableRawPointer,
    _ utf16_len: Int,
    _ length_type: UTF16LengthResult
) -> Int

@_extern(c)
func utf8_to_utf16_len(
    _ utf8: UnsafePointer<UInt8>,
    _ utf8_len: Int,
    _ length_type: UTF16LengthResult
) -> Int

@_extern(c)
func utf16_read_codepoint(_ pointer: UnsafeRawPointer, _ offset: Int) -> UInt16

@_extern(c)
func count_utf16_code_units(_ pointer: UnsafeRawPointer, _ len: Int)-> Int

@_extern(c)
func count_characters_in_utf16_codepoints(_ pointer: UnsafeRawPointer, _ len: Int)-> Int
#endif
