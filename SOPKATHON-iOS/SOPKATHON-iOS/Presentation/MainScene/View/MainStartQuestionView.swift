//
//  MainStartQuestionView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

class MainStartQuestionView: UIView {
    
    // MARK: - Properties
//    weak var buttonDelegate: ButtonDelegate?
    
    // MARK: - UI Components
    private let startTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나 몇 살이지?"
        label.textColor = .SOPTWhite
        label.font = .pretendardBold(size: 24)
        return label
    }()
    
    private let startSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 내 나이를 확인해봐요"
        label.textColor = .SOPTWhite
        label.font = .pretendardRegular(size: 16)
        return label
    }()
    
    private let startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.go_to_question
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
extension MainStartQuestionView {
    private func setUI() {
        self.backgroundColor = .black
    }
    
    private func setHierarchy() {
        self.addSubviews(startTitleLabel,
                         startSubTitleLabel,
                         startImageView)
    }
    
    private func setLayout() {
        startTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(36)
        }
        startSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(startTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(36)
        }
        
        startImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(30)
            $0.width.equalTo(72)
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
