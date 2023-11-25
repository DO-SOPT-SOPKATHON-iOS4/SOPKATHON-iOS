//
//  UILabel+.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import UIKit

extension UILabel {
    func partFontChange(targetString: String, font: UIFont, textColor: UIColor) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedString
    }
    
    func partColorChange(targetString: String, textColor: UIColor) {
        guard let existingText = self.text else {
            return
        }
        let existingAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
        let attributedStr = NSMutableAttributedString(string: existingText, attributes: existingAttributes)
        let range = (existingText as NSString).range(of: targetString)
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedStr
    }
}
