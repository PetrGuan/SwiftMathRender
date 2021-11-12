//
//  MathUIView.swift
//  MathRender
//
//  Created by Petr Guan on 2021/11/2.
//

import Foundation
import UIKit

public enum MathUIViewMode {
    case display // $$ in TeX
    case text // $ in TeX
}

public class MathUIView: UIView {
    public var latex: String = "" {
        didSet {
            //    _error = nil;
            //    NSError* error = nil;
            //    _mathList = [MTMathListBuilder buildFromString:latex error:&error];
            //    if (error) {
            //        _mathList = nil;
            //        _error = error;
            //        _errorLabel.text = error.localizedDescription;
            //        _errorLabel.frame = self.bounds;
            //        _errorLabel.hidden = !self.displayErrorInline;
            //    } else {
            //        _errorLabel.hidden = YES;
            //    }
            //    [self invalidateIntrinsicContentSize];
            //    [self setNeedsLayout];
        }
    }
    
    public var mode: MathUIViewMode = .display {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    public var textColor: UIColor = .black {
        didSet {
            //    _displayList.textColor = textColor;
            setNeedsLayout()
        }
    }
    
    
    //- (void)setFont:(MTFont*)font
    //{
    //    NSParameterAssert(font);
    //    _font = font;
    //    [self invalidateIntrinsicContentSize];
    //    [self setNeedsLayout];
    //}
    
    public var fontSize: UIFont = .systemFont(ofSize: 20.0) {
        didSet {
            //    MTFont* font = [_font copyFontWithSize:_fontSize];
            //    self.font = font;
        }
    }
    
    public override var intrinsicContentSize: CGSize { sizeThatFits(.zero) }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

//@implementation MTMathUILabel {
//    MTLabel* _errorLabel;
//}
//

//- (void) initCommon
//{
//    self.layer.geometryFlipped = YES;  // For ease of interaction with the CoreText coordinate system.
//    // default font size
//    _fontSize = 20;
//    _contentInsets = MTEdgeInsetsZero;
//    _labelMode = kMTMathUILabelModeDisplay;
//    MTFont* font = [MTFontManager fontManager].defaultFont;
//    self.font = font;
//    _textAlignment = kMTTextAlignmentLeft;
//    _displayList = nil;
//    _displayErrorInline = true;
//    self.backgroundColor = [MTColor clearColor];
//
//    _textColor = [MTColor blackColor];
//    _errorLabel = [[MTLabel alloc] init];
//    _errorLabel.hidden = YES;
//    _errorLabel.layer.geometryFlipped = YES;
//    _errorLabel.textColor = [MTColor redColor];
//    [self addSubview:_errorLabel];
//}
//
//
//
//
//- (void)setContentInsets:(MTEdgeInsets)contentInsets
//{
//    _contentInsets = contentInsets;
//    [self invalidateIntrinsicContentSize];
//    [self setNeedsLayout];
//}
//
//- (void) setMathList:(MTMathList *)mathList
//{
//    _mathList = mathList;
//    _error = nil;
//    _latex = [MTMathListBuilder mathListToString:mathList];
//    [self invalidateIntrinsicContentSize];
//    [self setNeedsLayout];
//}
//
//
//- (void)setTextAlignment:(MTTextAlignment)textAlignment
//{
//    _textAlignment = textAlignment;
//    [self invalidateIntrinsicContentSize];
//    [self setNeedsLayout];
//}
//
//- (MTLineStyle) currentStyle
//{
//    switch (_labelMode) {
//        case kMTMathUILabelModeDisplay:
//            return kMTLineStyleDisplay;
//        case kMTMathUILabelModeText:
//            return kMTLineStyleText;
//    }
//}
//
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(MTRect)rect
//{
//    [super drawRect:rect];
//
//    if (!_mathList) {
//        return;
//    }
//
//    // Drawing code
//    CGContextRef context = MTGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//
//    [_displayList draw:context];
//
//    CGContextRestoreGState(context);
//}
//
//- (void) layoutSubviews
//{
//    if (_mathList) {
//        _displayList = [MTTypesetter createLineForMathList:_mathList font:_font style:self.currentStyle];
//        _displayList.textColor = _textColor;
//
//        // Determine x position based on alignment
//        CGFloat textX = 0;
//        switch (self.textAlignment) {
//            case kMTTextAlignmentLeft:
//                textX = self.contentInsets.left;
//                break;
//            case kMTTextAlignmentCenter:
//                textX = (self.bounds.size.width - self.contentInsets.left - self.contentInsets.right - _displayList.width) / 2 + self.contentInsets.left;
//                break;
//            case kMTTextAlignmentRight:
//                textX = (self.bounds.size.width - _displayList.width - self.contentInsets.right);
//                break;
//        }
//
//        CGFloat availableHeight = self.bounds.size.height - self.contentInsets.bottom - self.contentInsets.top;
//        // center things vertically
//        CGFloat height = _displayList.ascent + _displayList.descent;
//        if (height < _fontSize/2) {
//            // Set the height to the half the size of the font
//            height = _fontSize/2;
//        }
//        CGFloat textY = (availableHeight - height) / 2 + _displayList.descent + self.contentInsets.bottom;
//        _displayList.position = CGPointMake(textX, textY);
//    } else {
//        _displayList = nil;
//    }
//    _errorLabel.frame = self.bounds;
//    [self setNeedsDisplay];
//}
//
//
//- (CGSize) sizeThatFits:(CGSize)size
//{
//    MTMathListDisplay* displayList = nil;
//    if (_mathList) {
//        displayList = [MTTypesetter createLineForMathList:_mathList font:_font style:self.currentStyle];
//    }
//
//    size.width = displayList.width + self.contentInsets.left + self.contentInsets.right;
//    size.height = displayList.ascent + displayList.descent + self.contentInsets.top + self.contentInsets.bottom;
//    return size;
//}
//
//@end
