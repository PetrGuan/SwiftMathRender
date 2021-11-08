//
//  MathFontStyle.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/8.
//

import Foundation


/// The fontstyle of the atom determines what style the character is rendered in. This only applies to atoms
/// of type MathAtomVariable and MathAtomNumber. None of the other atom types change their font style.
enum MathFontStyle: Int {
    /// The default latex rendering style. i.e. variables are italic and numbers are roman.
    case `default` = 0
    /// Roman font style i.e. \mathrm
    case roman
    /// Bold font style i.e. \mathbf
    case bold
    /// Caligraphic font style i.e. \mathcal
    case caligraphic
    /// Typewriter (monospace) style i.e. \mathtt
    case typewriter
    /// Italic style i.e. \mathit
    case italic
    /// San-serif font i.e. \mathss
    case sansSerif
    /// Fractur font i.e \mathfrak
    case fraktur
    /// Blackboard font i.e. \mathbb
    case blackboard
    /// Bold italic
    case boldItalic
}
