//
//  CardBackViewController.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

class CardBackViewController: UIViewController {
    
    private lazy var cardBack = CardBackView()
    
    override func loadView() {
        super.loadView()
        
        view = cardBack
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setGesture()
        // Do any additional setup after loading the view.
    }
    

}

extension CardBackViewController {
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        print("✅")
        self.dismiss(animated: true)
    }
}
