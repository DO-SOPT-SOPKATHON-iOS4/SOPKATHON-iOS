//
//  OnboardingAgeView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

import SnapKit
// MARK: - Properties
final class OnboardingAgeView: UIView {

    // MARK: - Properties
    weak var buttonDelegate: ButtonDelegate?
    
    // MARK: - UI Components
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "그럼 몇 살이야?"
        label.textColor = .SOPTWhite
        label.font = .pretendardBold(size: 28)
        return label
    }()
    
    public let ageTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .SOPTBlack
        textField.attributedPlaceholder = NSAttributedString(string: "나이를 입력해 주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.SOPTGrey400, NSAttributedString.Key.font : UIFont.pretendardSemiBold(size: 16)])
        textField.setLeftPaddingPoints(12)
        textField.layer.cornerRadius = 16
        return textField
    }()
    
    public let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendardBold(size: 20)
        button.backgroundColor = .SOPTGreen
        button.layer.cornerRadius = 16
        return button
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
extension OnboardingAgeView {
    private func setUI() {
        self.backgroundColor = .black
    }
    
    private func setHierarchy() {
        self.addSubviews(ageLabel,
                         ageTextField,
                         startButton)
    }
    
    private func setLayout() {
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(189)
            $0.leading.equalToSuperview().inset(20)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
        
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(29)
            $0.height.equalTo(60)
        }
    }
    
    private func setAddTarget() {
        startButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    
    @objc
    private func isTapped(_ sender: UIButton) {
        switch sender {
        case startButton:
            buttonDelegate?.nextButtonTapped()
        default:
            break
        }
    }
    
    @objc
    private func buttonTapped() {
        
    }
    
    private func setRegisterCell() {
        
    }
    
    private func setDataBind() {
        
    }
}
