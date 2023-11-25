//
//  CardViewController.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

import SnapKit

final class CardViewController: UIViewController {
    
    lazy var cardView = UIView()
    private let cardfront = CardFrontView()
    private let cardback = CardBackView()
    
    var isFront = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setGesture()
    }
}

extension CardViewController {
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setHierarchy() {
        view.addSubview(cardView)
        cardView.addSubviews(cardfront)
    }
    
    func setLayout() {
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(441)
        }
        
        cardfront.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
    
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        if isFront {
            isFront = false
            UIView.transition(from: cardfront, to: cardback, duration: 0.3, options: .transitionFlipFromLeft) { _ in
                self.cardback.snp.remakeConstraints {
                    $0.edges.equalToSuperview()
                }
            }
        } else {
            isFront = true
            UIView.transition(from: cardback, to: cardfront, duration: 0.3, options: .transitionFlipFromLeft) { _ in
                self.cardfront.snp.remakeConstraints {
                    $0.edges.equalToSuperview()
                }
                
            }
        }
    }
}

