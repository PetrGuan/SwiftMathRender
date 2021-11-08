//
//  MathAtomType.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/8.
//

import Foundation

/// The type of the atom determines how it is rendered and spacing between the atoms.
enum MathAtomType: Int {
    /// A number or text in ordinary format - Ord in TeX
    case ordinary = 1
    /// A number - Does not exist in TeX
    case number
    /// A variable (i.e. text in italic format) - Does not exist in TeX
    case variable
    /// A large operator such as (sin/cos integral etc.) - Op in TeX
    case largeOperator
    /// A binary operator - Bin in TeX
    case binaryOperator
    /// A unary operator - Does not exist in TeX.
    case unaryOperator
    /// A relation e.g. = > < etc. - Rel in TeX
    case relation
    /// Open brackets - Open in TeX
    case open
    /// Close brackets - Close in TeX
    case close
    /// An fraction e.g 1/2 - generalized fraction noad in TeX
    case fraction
    /// A radical operator e.g. sqrt(2)
    case radical
    /// Punctuation such as  - Punct in TeX
    case punctuation
    /// A placeholder square for future input. Does not exist in TeX
    case placeholder
    /// An inner atom i.e. an embedded math list - Inner in TeX
    case inner
    /// An underlined atom - Under in TeX
    case underline
    /// An overlined atom - Over in TeX
    case overline
    /// An accented atom - Accent in TeX
    case accent
    
    // Atoms after this point do not support subscripts or superscripts
    
    /// A left atom - Left & Right in TeX. We don't need two since we track boundaries separately.
    case boundary = 101
    
    // Atoms after this are non-math TeX nodes that are still useful in math mode. They do not have
    // the usual structure.
    
    /// Spacing between math atoms. This denotes both glue and kern for TeX. We do not
    /// distinguish between glue and kern.
    case space = 201
    /// Denotes style changes during rendering.
    case style
    case color
    case colorbox
    
    // Atoms after this point are not part of TeX and do not have the usual structure.
    
    /// An table atom. This atom does not exist in TeX. It is equivalent to the TeX command
    /// halign which is handled outside of the TeX math rendering engine. We bring it into our
    /// math typesetting to handle matrices and other tables.
    case table = 1001
}
