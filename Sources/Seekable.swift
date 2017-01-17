//
//  Seekable.swift
//  R2Streamer
//
//  Created by Olivier Körner on 11/01/2017.
//  Copyright © 2017 Readium. All rights reserved.
//

import Foundation


/// Reference point for offset in seekable streams
public enum SeekWhence {
    /// The beginning of the file
    case startOfFile
    /// The end of the file
    case endOfFile
    /// the current position in the file
    case currentPosition
}


/// Protocol for seekable resources
public protocol Seekable {
    
    /// The total length of the data
    var length: UInt64 { get }
    
    /// The current offset in the data
    var offset: UInt64 { get }
    
    /**
     Set the current position in the data stream.
     
     - parameter offset: The offset to seek to.
     - parameter whence: Specifies the beginning, the end or the current position as the reference point for `offset`
    */
    func seek(offset: Int64, whence: SeekWhence) throws

}


/// Base (abstract) class for seekable input streams
open class SeekableInputStream: InputStream, Seekable {
    
    public var length: UInt64 {
        get {
            fatalError("This getter must be overriden")
            return 0
        }
    }
    
    public var offset: UInt64 {
        get {
            fatalError("This getter must be overriden")
            return 0
        }
    }
    
    public func seek(offset: Int64, whence: SeekWhence) throws {
        setProperty(offset, forKey: Stream.PropertyKey.fileCurrentOffsetKey)
        fatalError("This getter must be overriden")
    }
    
    init() {
        super.init(data: Data())
    }
}
