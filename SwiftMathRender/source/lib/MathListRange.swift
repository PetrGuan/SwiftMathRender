//
//  MathListRange.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/8.
//

import Foundation

/** A range of atoms in an `MathList`. This is similar to `NSRange` with a start and length, except that
 the starting location is defined by a `MathListIndex` rather than an ordinary integer.
 */
class MathListRange {
    /// The starting location of the range. Cannot be `nil`.
    let start: MathListIndex
    /// The size of the range.
    let length: Int
    
    var description: String {
        String.init(format: "(%@, %d)", start.description, length)
    }
    
    init(with start: MathListIndex, length: Int) {
        self.start = start
        self.length = length
    }
    
    convenience init (with start: MathListIndex) {
        self.init(with: start, length: 1)
    }
    
    convenience init(with range: NSRange) {
        self.init(with: MathListIndex.level0Index(index: range.location), length: range.length)
    }
    
    convenience init(with start: Int) {
        self.init(with: MathListIndex.level0Index(index: start))
    }
    
    func subIndexRange() -> MathListRange? {
        if start.subIndexType != .none, let sub = start.subIndex {
            return MathListRange(with: sub, length: length)
        }
        else {
            return nil
        }
    }
    
    func finalRange() -> NSRange {
        return NSMakeRange(start.finalIndex, length)
    }
    
    func union(ranges: [MathListRange]) {
        //    NSAssert((ranges.count > 0), @"Need to union at least one range");
        //
        //    MTMathListRange* unioned = ranges[0];
        //    for (int i = 1; i < ranges.count; i++) {
        //        MTMathListRange* next = ranges[i];
        //        [unioned unionRange:next];
        //    }
        //    return unioned;
        
        assert(!ranges.isEmpty, "Need to union at least one range")
        
    }
    
    func union(range: MathListRange) -> MathListRange? {
        if !start.isAtSameLevel(with: range.start) {
            assert(false, "Cannot union ranges at different levels")
            return nil
        }
        
        let r1 = finalRange()
        let r2 = range.finalRange()
        let unionRange = NSUnionRange(r1, r2)
        
        let start: MathListIndex
        if unionRange.location == r1.location {
            start = self.start
        }
        else {
            assert(unionRange.location == r2.location)
            start = range.start
        }
        
        return MathListRange(with: start, length: unionRange.length)
    }
}
