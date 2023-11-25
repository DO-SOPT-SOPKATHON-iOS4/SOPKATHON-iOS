//
//  CardFrontViewController.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

final class CardFrontViewController: UIViewController {
    
    var historyContent: String?
    var historyTitle: String?
    
    lazy var cardfront = CardFrontView()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .SOPTWhite
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "나 몇 살이지?"
        label.textColor = .white
        label.font = .pretendardBold(size: 20)
        return label
    }()
    private lazy var mainBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: ImageLiterals.ic_left_arrow, style: .done, target: self, action: #selector(goToMain))
        btn.tintColor = .SOPTGrey600
        return btn
    }()
    
    override func loadView() {
        super.loadView()
        
        view = cardfront
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationButton()
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
        nav.cardBack.setHistoryBind(title: self.historyTitle ?? "", content: self.historyContent ?? "")
        self.present(nav, animated: true)
    }
    
    func setNavigationButton() {
        self.navigationItem.titleView = titleView
        self.navigationItem.leftBarButtonItem = mainBtn
        self.navigationController?.navigationBar.barTintColor = .SOPTBlack
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationController?.navigationBar.backgroundColor = .SOPTBlack
    }
    
    @objc
    func goToMain(){
        let nav = MainViewController()
        nav.nickname = "동훈"
        nav.age = 24
        self.navigationController?.pushViewController(nav, animated: false)
    }
}
