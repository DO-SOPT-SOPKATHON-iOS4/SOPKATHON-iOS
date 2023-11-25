//
//  CardFrontViewController.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

final class CardFrontViewController: UIViewController {
    
    private lazy var cardfront = CardFrontView()
    
    override func loadView() {
        super.loadView()
        
        view = cardfront
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setGesture()
    }
}

extension CardFrontViewController {
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        let nav = CardBackViewController()
        nav.modalTransitionStyle = .flipHorizontal
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
}
