//
//  UINavigationController+.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

extension UINavigationController {

    func navBackButton() {
        let backButton = UIBarButtonItem(title: "CustomBack", style: .plain, target: self, action: #selector(backButtonPressed))
        topViewController?.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backButtonPressed() {
        popViewController(animated: true)
    }
}
