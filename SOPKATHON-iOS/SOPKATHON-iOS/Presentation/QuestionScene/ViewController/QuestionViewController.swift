//
//  QuestionViewController.swift
//  SOPKATHON-iOS
//
//  Created by Woo Jye Lee on 11/26/23.
//

import UIKit
import SnapKit
import Shuffle

class QuestionViewController: UIViewController {

    let cardStack = SwipeCardStack()
      
    let cardImages = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        cardStack.dataSource = self
        self.view.backgroundColor = .black
        self.setLayout()
    }
    // MARK: - setLayout()
    private func setLayout() {
        view.addSubview(cardStack)
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        // cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
        NSLayoutConstraint.activate([cardStack.heightAnchor.constraint(equalToConstant: 310),
                                     cardStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     cardStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     cardStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     cardStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 198)
        ])

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.snp.makeConstraints() {
            $0.leading.equalTo(self.view).inset(20)
            $0.top.equalTo(cardStack.snp.bottom).inset(-20)
            $0.width.equalTo(158)
            $0.height.equalTo(150)
        }
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.snp.makeConstraints() {
            $0.trailing.equalTo(self.view).inset(20)
            $0.top.equalTo(cardStack.snp.bottom).inset(-20)
            $0.width.equalTo(158)
            $0.height.equalTo(150)
        }
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.snp.makeConstraints() {
            $0.leading.equalTo(self.view).inset(20)
            $0.bottom.equalTo(cardStack.snp.top).inset(-20)
        }
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.snp.makeConstraints() {
            $0.leading.equalTo(self.view)
            $0.trailing.equalTo(self.view)
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(14)
        }
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 40
        button.tintColor = .white
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        
        button.imageView!.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(40)
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(incrementProgressBar), for: .touchUpInside)
        return button
    }()
    @objc func buttonTapped() {
        cardStack.swipe(.left, animated: true)
    }
    lazy var button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView!.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(40)
        }
        button.tintColor = .white
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        button.addTarget(self, action: #selector(incrementProgressBar), for: .touchUpInside)
        return button
    }()
    @objc func buttonTapped1() {
        cardStack.swipe(.left, animated: true)
    }
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backbuttonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(decrementProgressBar), for: .touchUpInside)
        return button
    }()
    @objc func backbuttonTapped() {
        cardStack.undoLastSwipe(animated: true)
    }
    //MARK: - progressView
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .lightGray
        view.progressTintColor = .green
        view.progress = 0.0
        return view
    }()
    // MARK: - incrementProgressBar()
    @objc func incrementProgressBar() {
        
//        UIView.animate(withDuration: 10) {
//            let incrementAmount: Float = 0.1
//            self.progressView.progress += incrementAmount
//            self.progressView.setProgress(self.progressView.progress, animated: true)
//        }
        
        let incrementAmount: Float = 0.1
        progressView.progress += incrementAmount

        if progressView.progress > 1.0 {
            progressView.progress = 1.0
        }
        
        // MARK: - 만약 바 내용물 다 채워지면 화면 전환
    }
    @objc func decrementProgressBar() {
        let incrementAmount: Float = 0.1
        progressView.progress -= incrementAmount

        if progressView.progress > 1.0 {
            progressView.progress = 1.0
        }
        
        // MARK: - 만약 바 내용물 다 채워지면 화면 전환
    }
    
    // MARK: - func card()
    func card(fromImage image: String) -> SwipeCard {
      let card = SwipeCard()
        card.swipeDirections = [.left, .right]
        card.layer.cornerRadius = 60
        card.backgroundColor = .gray
        let label = UILabel()
        label.text = image
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        card.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints() {
            $0.centerX.equalTo(card)
            $0.centerY.equalTo(card)
        }
        
        let card1 = SwipeCard()
          card1.swipeDirections = [.left, .right]
          card1.layer.cornerRadius = 60
          card1.backgroundColor = .gray
          let label1 = UILabel()
          label1.text = image
          label1.textAlignment = .center
          label1.numberOfLines = 0
          label1.textColor = .white
          card1.addSubview(label1)
          label1.translatesAutoresizingMaskIntoConstraints = false
          label1.snp.makeConstraints() {
              $0.centerX.equalTo(card1)
              $0.centerY.equalTo(card1)
          }
      
      let leftOverlay = card1
            leftOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            leftOverlay.layer.cornerRadius = 40
      
      let rightOverlay = UIView()
            rightOverlay.backgroundColor = .red
      
      card.setOverlays([.left: leftOverlay, .right: rightOverlay])
      
      return card
    }
}
// MARK: - Extension+
extension QuestionViewController: SwipeCardStackDataSource {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        return card(fromImage: cardImages[index])
    }

    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
      return cardImages.count
    }
}
extension QuestionViewController: SwipeCardStackDelegate {
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        cardStack.swipe(.left, animated: true)
    }
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        cardStack.undoLastSwipe(animated: true)
    }
}
