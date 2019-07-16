//
//  JLAttributedTextView.swift
//  JLAttributesTextView
//
//  Created by 刘业臻 on 16/4/24.
//  Copyright © 2016年 luiyezheng. All rights reserved.
//

import UIKit

public class JLAttributedTextView: UITextView {

    
    public public(set) var textAttributes: [String: AnyObject] = [:]
    
    //MARK: -
    //MARK: Alpha
    public var textAlpha: CGFloat = 1 {
        didSet {
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor)] = foregroundColor?.withAlphaComponent(textAlpha)
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
        }
    }
    
    //MARK: -
    //MARK: Font
    
    public var fontName: String = "HelveticaNeue" {
        didSet {
            let font = UIFont(name: fontName, size: fontSize)
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.font)] = font
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
            self.font = font
        }
    }
    
    public var fontSize: CGFloat = 20 {
        didSet {
            let font = UIFont(name: fontName, size: fontSize)
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.font)] = font
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
            self.font = font
        }
    }
    
    //MARK: -
    //MARK: forgroundColor
    
    public var foregroundColor: UIColor? {
        didSet {
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor)] = foregroundColor
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
        }
    }
    
    //MARK: -
    //MARK: backgroundColor
    public var textBackgroundColor: UIColor? {
        didSet {
            self.layer.backgroundColor = textBackgroundColor?.cgColor
            //textAttributes[NSBackgroundColorAttributeName] = textBackgroundColor
            //self.attributedText = NSAttributedString(string: self.text, attributes: textAttributes)
        }
    }
    
    public var textBackgroundAlpha: CGFloat? {
        didSet {
            //textAttributes[NSBackgroundColorAttributeName] = textBackgroundColor?.colorWithAlphaComponent(textBackgroundAlpha!)
            //self.attributedText = NSAttributedString(string: self.text, attributes: textAttributes)
            self.layer.backgroundColor = textBackgroundColor?.withAlphaComponent(textBackgroundAlpha!).cgColor
        }
    }

    
    //MARK: -
    //MARK: Paragraph style

    public var paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle() {
        didSet {
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
        }
    }

    public var alignment: NSTextAlignment {
        get {
            return paragraphStyle.alignment
        }
        set {
            paragraphStyle.alignment = newValue
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
        }
    }
    
    public var lineSpacing: CGFloat {
        get {
            return paragraphStyle.lineSpacing
        }
        
        set {
            paragraphStyle.lineSpacing = newValue
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
        }
    }
    
    public var paragraphSpacing: CGFloat {
        get {
            return paragraphStyle.paragraphSpacing
        }
        
        set {
            paragraphStyle.paragraphSpacing = newValue
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
        }
    }
    
    #if os(iOS) || os(tvOS)
    //MARK: -
    //MARK: Shadow
    
    public var shadow: NSShadow? = NSShadow() {
        didSet {
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.shadow)] = shadow
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
        }
    }
    
    public var textShadowOffset: CGSize! {
        didSet {
            shadow?.shadowOffset = textShadowOffset
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.shadow)] = shadow
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
        }
    }
    
    public var textShadowColor: UIColor! {
        didSet {
            shadow?.shadowColor = textShadowColor
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.shadow)] = shadow
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
        }
    }
    
    public var textShadowBlur: CGFloat! {
        didSet {
            shadow?.shadowBlurRadius = textShadowBlur
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.shadow)] = shadow
            textAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = paragraphStyle
            self.attributedText = NSAttributedString(string: self.text, attributes: convertToOptionalNSAttributedStringKeyDictionary(textAttributes))
            
        }
    }

    #endif
    
}

#if os(iOS) || os(tvOS)
    extension JLAttributedTextView {
        // MARK: - Shadow
        
        /**
         Sets the shadow attribute and returns the receiver.
         
         - parameter color:      The color of the shadow.
         - parameter offset:     The offset values of the shadow.
         - parameter blurRadius: The blur radius of the shadow.
         
         - returns: The receiver.
         */
        public func shadow(color: AnyObject?, offset: CGSize, blurRadius: CGFloat) -> Self {
            return shadow({
                let shadow = NSShadow()
                shadow.shadowColor = color
                shadow.shadowOffset = offset
                shadow.shadowBlurRadius = blurRadius
                return shadow
                }() as NSShadow)
        }
        
        /**
         Sets the shadow attribute and returns the receiver.
         
         - parameter shadow: The shadow.
         
         - returns: The receiver.
         */
        public func shadow(_ shadow: NSShadow?) -> Self {
            self.shadow = shadow
            return self
        }
        

    }
#endif

//MARK: -
//MARK: CGRect of Cursor

extension JLAttributedTextView {
    override public func caretRect(for position: UITextPosition) -> CGRect {
        var originalRect = super.caretRect(for: position)
        originalRect.size.height = self.font!.pointSize - self.font!.descender
        // "descender" is expressed as a negative value,
        // so to add its height you must subtract its value
        
        return originalRect
    }
    
}

































// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
