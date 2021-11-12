//
//  MathListIndex.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/8.
//

import Foundation

/**
 * An index that points to a particular character in the MathList. The index is a LinkedList that represents
 * a path from the beginning of the MathList to reach a particular atom in the list. The next node of the path
 * is represented by the subIndex. The path terminates when the subIndex is nil.
 *
 * If there is a subIndex, the subIndexType denotes what branch the path takes (i.e. superscript, subscript,
 * numerator, denominator etc.).
 * e.g in the expression 25^{2/4} the index of the character 4 is represented as:
 * (1, superscript) -> (0, denominator) -> (0, none)
 * This can be interpreted as start at index 1 (i.e. the 5) go up to the superscript.
 * Then look at index 0 (i.e. 2/4) and go to the denominator. Then look up index 0 (i.e. the 4) which this final
 * index.
 *
 * The level of an index is the number of nodes in the LinkedList to get to the final path.
 */
class MathListIndex {
    /// The index of the associated atom.
    var atomIndex: Int
    
    /// The type of subindex, e.g. superscript, numerator etc.
    var subIndexType: MathListSubIndexType
    
    /// The index into the sublist.
    var subIndex: MathListIndex?
    
    /// The previous index if present. Returns `nil` if there is no previous index.
    var previous: MathListIndex?
    
    /// Returns the next index.
    var next: MathListIndex
    
    var description: String { "" }
    
    var finalIndex: Int {
        if subIndexType == .none {
            return atomIndex
        }
        else {
            return subIndex?.finalIndex ?? atomIndex
        }
    }
    
    /**
     * Returns true if this index represents the beginning of a line. Note there may be multiple lines in a MTMathList,
     * e.g. a superscript or a fraction numerator. This returns true if the innermost subindex points to the beginning of a
     * line.
     */
    var isAtBeginningOfLine: Bool {
        return finalIndex == 0
    }
    
    /// Returns the type of the innermost sub index
    var finalSubIndexType: MathListSubIndexType {
        if subIndex?.subIndex != nil {
            return subIndex?.finalSubIndexType ?? subIndexType
        }
        else {
            return subIndexType
        }
    }
    
    /// Returns true if any of the subIndexes of this index have the given type.
    func hasSubIndexType(of type: MathListSubIndexType) -> Bool {
        if subIndexType == type {
            return true
        }
        else {
            return subIndex?.hasSubIndexType(of: subIndexType) ?? false
        }
    }
    
    func isAtSameLevel(with other: MathListIndex) -> Bool {
        if subIndexType != other.subIndexType {
            return false
        }
        else if subIndexType == .none {
            // No subindexes, they are at the same level.
            return true
        }
        else {
            if let otherSub = other.subIndex {
                return subIndex?.isAtSameLevel(with: otherSub) ?? true
            }
            return true
        }
    }
    
    static func index(at location: Int, with subIndex: MathListIndex, type: MathListSubIndexType) -> MathListIndex {
        let index = Self.level0Index(index: location)
        index.subIndexType = type
        index.subIndex = subIndex
        return index
    }
    
    func levelUp(with subIndex: MathListIndex, type: MathListSubIndexType) -> MathListIndex? {
        if subIndexType == .none {
            return Self.index(at: atomIndex, with: subIndex, type: type)
        }
        
        // we have to recurse
        if let sub = self.subIndex {
            let levelUp = sub.levelUp(with: subIndex, type: type)
            return Self.index(at: atomIndex, with: levelUp, type: subIndexType)
        }
        else {
            return nil
        }
    }
    
    static func level0Index(index: Int) -> MathListIndex {
        let mlIndex = MathListIndex()
        mlIndex.atomIndex = index
        return mlIndex
    }
}
