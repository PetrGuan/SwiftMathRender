//
//  ParseError.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/12.
//

import Foundation

/// The error encountered when parsing a LaTeX string.
enum ParseError {
    /// The braces { } do not match.
    case mismatchBraces
    /// A command in the string is not recognized.
    case invalidCommand
    /// An expected character such as ] was not found.
    case characterNotFound
    /// The \left or \right command was not followed by a delimiter.
    case missingDelimiter
    /// The delimiter following \left or \right was not a valid delimiter.
    case invalidDelimiter
    /// There is no \right corresponding to the \left command.
    case missingRight
    /// There is no \left corresponding to the \right command.
    case missingLeft
    /// The environment given to the \begin command is not recognized
    case invalidEnv
    /// A command is used which is only valid inside a \begin\end environment
    case missingEnv
    /// There is no \begin corresponding to the \end command.
    case missingBegin
    /// There is no \end corresponding to the \begin command.
    case missingEnd
    /// The number of columns do not match the environment
    case invalidNumColumns
    /// Internal error due to a programming mistake.
    case internalError
    /// Limit control applied incorrectly
    case invalidLimits
}
