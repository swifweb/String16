//
//  String16.swift
//
//
//  Created by Mihael Isaev on 15.05.2024.
//

import Foundation

#if swift(>=5.10) // FIXME: change to >=6.0
public struct String16: Equatable, Hashable, ExpressibleByStringLiteral {
    public let bytesCount: Int
    public let codepointsCount: Int
    public let charactersCount: Int
    public var codepoints: [UInt16]
    public var pointer: UnsafeRawPointer {
        var codepoints = self.codepoints
        return UnsafeRawPointer(&codepoints)
    }
    
    public init(stringLiteral value: StaticString) {
        let bytesToBeAllocated = utf8_to_utf16_len(value.utf8Start, value.utf8CodeUnitCount, .LengthInBytes) + 1
        self.bytesCount = bytesToBeAllocated - 1
        self.charactersCount = value.utf8CodeUnitCount
        let _pointer = __malloc(bytesToBeAllocated).assumingMemoryBound(to: UInt8.self)
        self.codepointsCount = utf8_to_utf16(value.utf8Start, value.utf8CodeUnitCount, _pointer, bytesToBeAllocated, .LengthInCodepoints)
        self.codepoints = (0...(self.codepointsCount - 1)).map { UInt16(utf16_read_codepoint(_pointer, $0)) }
        __free(_pointer)
    }
    
    public init (bytesCount: Int, pointer: UnsafeRawPointer) {
        self.bytesCount = bytesCount
        self.charactersCount = 0// TODO: count_characters_in_utf16_codepoints
        let cpc = Int(bytesCount / 2)
        self.codepointsCount = cpc
        self.codepoints = (0...(cpc - 1)).map { UInt16(utf16_read_codepoint(pointer, $0)) }
    }
    
    public static func == (lhs: String16, rhs: String16) -> Bool {
        lhs.codepoints == rhs.codepoints
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(codepoints)
    }
}
#endif
