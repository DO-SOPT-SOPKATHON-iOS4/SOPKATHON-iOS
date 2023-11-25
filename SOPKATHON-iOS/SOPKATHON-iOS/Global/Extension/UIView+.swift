//
//  UIView+.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/25/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
