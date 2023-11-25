//
//  MainLaunchScreenView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

class MainLaunchScreenView: UIView {
    
    // MARK: - Properties
//    weak var buttonDelegate: ButtonDelegate?
    let nickname: String = ""
    let age: String = ""
    
    // MARK: - UI Components
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "동훈,\n너 정말 24살 맞아?"
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "folder.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: - Extensions
extension MainLaunchScreenView {
    private func setUI() {
        self.backgroundColor = .black
    }
    
    private func setHierarchy() {
        self.addSubviews(mainTitleLabel, mainImageView)
    }
    
    private func setLayout() {
        mainTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(189)
            $0.leading.equalToSuperview().inset(25)
        }
        
        mainImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(120)
            $0.width.equalTo(220)
        }
    }
    
    private func setAddTarget() {
//        startButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    
//    @objc
//    private func isTapped(_ sender: UIButton) {
//        switch sender {
//        case startButton:
//            buttonDelegate?.nextButtonTapped()
//        default:
//            break
//        }
//    }
    
    @objc
    private func buttonTapped() {
        
    }
    
    private func setRegisterCell() {
        
    }
    
    private func setDataBind() {
        
    }
}
