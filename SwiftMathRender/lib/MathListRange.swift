//
//  MathListRange.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/8.
//

import Foundation

class MathListRange {
    let start: MathListIndex
    let length: Int
    
    var description: String {
        String.init(format: "(%@, %d)", start.description, length)
    }
    
    init(with start: MathListIndex, length: Int) {
        self.start = start
        self.length = length
    }
    
    func subIndexRange() {
//        if (self.start.subIndexType != kMTSubIndexTypeNone) {
//                return [MTMathListRange makeRange:self.start.subIndex length:self.length];
//            }
//            return nil;
    }
    
    func finalRange() {
        // return NSMakeRange(self.start.finalIndex, self.length);
    }
}
