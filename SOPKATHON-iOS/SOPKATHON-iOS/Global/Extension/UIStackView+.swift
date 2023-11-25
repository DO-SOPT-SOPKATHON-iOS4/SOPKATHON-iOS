//
//  UIStackView+.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
