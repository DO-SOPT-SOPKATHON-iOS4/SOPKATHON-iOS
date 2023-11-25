//
//  CardFrontViewController.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

final class CardFrontViewController: UIViewController {
    
    private lazy var cardfront = CardFrontView()
    
    private var questionListEntity: [QuestionListEntity] = []
    
    override func loadView() {
        super.loadView()
        
        view = cardfront
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setGesture()
        getQuestionListAPI()
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

extension CardFrontViewController {
    func getQuestionListAPI() {
        QuestionGetService.shared.getQueestionListAPI { networkResult in
            print(networkResult)
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<[QuestionListEntity]> {
                    dump(data)
                    if let listData = data.data {
                        self.questionListEntity = listData
                    }
                }
            case .requestErr, .serverErr:
                print("오류발생")
            default:
                break
            }
        }
    }
}
