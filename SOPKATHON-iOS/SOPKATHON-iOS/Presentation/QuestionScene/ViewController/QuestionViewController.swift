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
    
    // 답변 받을 배열 선언
    var replyArray: [Result] = []
    
    var index = 1
    var number = 0
    
    var nickName: String = "아라"
    
    private var questionListEntity: [QuestionListEntity] = []
    
    let cardStack = SwipeCardStack()
      
    var cardImages: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        cardStack.dataSource = self
        self.view.backgroundColor = .black
        self.setLayout()
        getQuestionListAPI()
    }
    // MARK: - setLayout()
    private func setLayout() {
        view.addSubview(cardStack)
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        // cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
        NSLayoutConstraint.activate([cardStack.heightAnchor.constraint(equalToConstant: 318),
                                     cardStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
                                     cardStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
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
        button.layer.cornerRadius = 40
        button.tintColor = .white
        button.setImage(UIImage(named: "QA_OX_btn_O"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        button.addTarget(self, action: #selector(incrementProgressBar), for: .touchUpInside)
        return button
    }()

    lazy var button1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "QA_OX_btn_X"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        button.addTarget(self, action: #selector(incrementProgressBar), for: .touchUpInside)
        return button
    }()
    @objc func buttonTapped1(_ sender: UIButton) {
        switch sender {
        case button:
            replyArray.append(Result(questionId: index, answerType: true))
        case button1:
            replyArray.append(Result(questionId: index, answerType: false))
        default:
            break
        }
        print(replyArray)
        index+=1

        cardStack.swipe(.left, animated: true)
    }
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .SOPTGrey600
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
        view.trackTintColor = .SOPTGrey600
        view.progressTintColor = .SOPTGreen
        view.progress = 0.0
        return view
    }()
    // MARK: - incrementProgressBar()
    @objc func incrementProgressBar() {
        
        let incrementAmount: Float = 0.1
        progressView.progress += incrementAmount
        
        if progressView.progress == 1.0 {
            postQuestionreply.shared.postInviteAPI(nickname: nickName, result: replyArray, completion: { networkResult in
//                switch networkResult {
//                case .success(let data):
//                    
//                default:
//                    
//                }
             
                self.navigationController?.pushViewController(CardFrontViewController(), animated: true)
            })
        }
        
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
        card.backgroundColor = .SOPTGrey800
        // 질문 번호 라벨
        let label = UILabel()
        label.text = "Q: \(index)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        card.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendardBold(size: 28)
        label.snp.makeConstraints() {
            $0.centerX.equalTo(card)
            $0.centerY.equalTo(card)
        }
        /// 질문 내용 라벨
        let label2 = UILabel()
        label2.text = image
        label2.textAlignment = .center
        label2.numberOfLines = 0
        label2.textColor = .white
        card.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.snp.makeConstraints() {
            $0.centerX.equalTo(card)
            $0.bottom.equalTo(label.snp.top).inset(70)
            $0.trailing.leading.equalTo(card).inset(20)
        }
        ///
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
            leftOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
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

//extension QuestionViewController {
//    func getQuestionListAPI() {
//        QuestionGetService.shared.getQueestionListAPI { networkResult in
//            print(networkResult)
//            switch networkResult {
//            case .success(let data):
//                if let data = data as? GenericResponse<[QuestionListEntity]> {
//                    dump(data)
//                    if let listData = data.data {
//                        self.questionListEntity = listData
//                    }
//                    DispatchQueue.main.async { [self] in
//                        for i in 0..<self.questionListEntity.count {
//                            cardImages.append(questionListEntity[i].questionContent)
//                            print(cardImages)
////                            print(questionListEntity[i].questionContent)
//                        }
//                    }
//                }
//            case .requestErr, .serverErr:
//                print("오류발생")
//            default:
//                break
//            }
//        }
//    }
//}
