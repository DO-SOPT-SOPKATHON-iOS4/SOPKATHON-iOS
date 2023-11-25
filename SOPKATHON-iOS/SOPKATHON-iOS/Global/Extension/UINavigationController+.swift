//
//  UINavigationController+.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

extension UINavigationController {

    func navBackButton() {
        
        let backButtonImage = ImageLiterals.ic_left_arrow
        self.navigationBar.tintColor = .SOPTGrey600
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        topViewController?.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backButtonPressed() {
        popViewController(animated: true)
    }
}
