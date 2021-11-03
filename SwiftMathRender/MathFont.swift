//
//  MathFont.swift
//  SwiftMathRender
//
//  Created by Petr Guan on 2021/11/3.
//

import CoreGraphics
import CoreText
import Foundation

public class MathFont {
    private let defaultCGFont: CGFont
    private let ctFont: CTFont
    private let rawMathTable: [String: Any]
    // private let mathTable: MathFontTable
    
    public var fontSize: CGFloat { CTFontGetSize(ctFont) }
    
    public init?(name: String, size: CGFloat) {
        // CTFontCreateWithName does not load the complete math font, it only has about half the glyphs of the full math font.
        // In particular it does not have the math italic characters which breaks our variable rendering.
        // So we first load a CGFont from the file and then convert it to a CTFont.
        let bundle = MathFont.fontBundle()
        guard let fontPath = bundle?.path(forResource: name, ofType: "otf") else {
            return nil
        }
        
        // CGDataProviderRef fontDataProvider = CGDataProviderCreateWithFilename(fontPath.UTF8String);
        guard let fontDataProvider = CGDataProvider(filename: fontPath) else {
            return nil
        }
        
        guard let font = CGFont(fontDataProvider) else {
            return nil
        }
        
        guard let mathTablePlistURL = bundle?.url(forResource: name, withExtension: "plist") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: mathTablePlistURL)
            guard let mathTablePlist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] else {
                return nil
            }
            
            self.defaultCGFont = font
            self.ctFont = CTFontCreateWithGraphicsFont(defaultCGFont, size, nil, nil)
            self.rawMathTable = mathTablePlist
            // mathTable = MathFontTable(font: self, mathTable: rawMathTable)
        } catch {
            print(error)
            return nil
        }
    }
    
    public func glyphName(of glyph: CGGlyph) -> String? {
        guard let cfstring = defaultCGFont.name(for: glyph) else {
            return nil
        }
        
        return String(cfstring)
    }
    
    public func glyph(of name: String) -> CGGlyph? {
        defaultCGFont.getGlyphWithGlyphName(name: name as CFString)
    }
    
    private static func fontBundle() -> Bundle? {
        // Uses bundle for class so that this can be access by the unit tests.
        guard let url = Bundle(for: MathFont.self).url(forResource: "mathFonts", withExtension: "bundle") else {
            return nil
        }
        
        return Bundle(url: url)
    }
}

//@interface MTFont ()
//@end
//
//@implementation MTFont
//
//
//- (MTFont *)copyFontWithSize:(CGFloat)size
//{
//    MTFont* copyFont = [[[self class] alloc] init];
//    copyFont.defaultCGFont = self.defaultCGFont;
//    // Retain the font as we are adding another reference to it.
//    CGFontRetain(copyFont.defaultCGFont);
//    copyFont.ctFont = CTFontCreateWithGraphicsFont(self.defaultCGFont, size, nil, nil);
//    copyFont.rawMathTable = self.rawMathTable;
//    copyFont.mathTable = [[MTFontMathTable alloc] initWithFont:copyFont mathTable:copyFont.rawMathTable];
//    return copyFont;
//}
//
//@end
