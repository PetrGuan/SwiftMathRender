//
//  MathListSubIndexType.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/8.
//

import Foundation

/// The type of the subindex denotes what branch the path to the atom that this index points to takes.
enum MathListSubIndexType: Int {
    /// The index denotes the whole atom subIndex is nil.
    case none = 0
    /// The position in the subindex is an index into the nucleus
    case nucleus
    /// The subindex indexes into the superscript.
    case superscript
    /// The subindex indexes into the subscript
    case `subscript`
    /// The subindex indexes into the numerator (only valid for fractions)
    case numerator
    /// The subindex indexes into the denominator (only valid for fractions)
    case denominator
    /// The subindex indexes into the radicand (only valid for radicals)
    case radicand
    /// The subindex indexes into the degree (only valid for radicals)
    case degree
    /// The subindex indexes into the inner list (only valid for inner)
    case inner
}
