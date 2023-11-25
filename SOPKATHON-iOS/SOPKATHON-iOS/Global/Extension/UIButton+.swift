//
//  UIButton+.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import UIKit

import Kingfisher

extension UIButton {
    func kfSetButtonImage(url : String, state: UIControl.State) {
        if let url = URL(string: url) {
            kf.setImage(with: url,
                        for: state, placeholder: nil,
                        options: [.transition(.fade(1.0))],
                        progressBlock: nil)
        }
    }
    
    func setButtonAttributedTitle(text: String, font: UIFont, color: UIColor) {
        let attributedString = NSMutableAttributedString(string: text, attributes: [.font: font, .foregroundColor: color])
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
