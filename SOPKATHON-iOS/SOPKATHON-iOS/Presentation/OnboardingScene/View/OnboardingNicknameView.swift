//
//  OnboardingNicknameView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 2023/11/26.
//

import UIKit

import SnapKit

protocol ButtonDelegate: AnyObject {
    func nextButtonTapped()
}

// MARK: - Properties
final class OnboardingNicknameView: UIView {

    // MARK: - Properties
    weak var buttonDelegate: ButtonDelegate?
    
    // MARK: - UI Components
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임이 뭐야?"
        label.textColor = .SOPTWhite
        label.font = .pretendardBold(size: 28)
        label.isHidden = true
        return label
    }()
    
    public let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .SOPTBlack
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해 주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.SOPTGrey400, NSAttributedString.Key.font : UIFont.pretendardSemiBold(size: 16)])
        textField.setLeftPaddingPoints(12)
        textField.layer.cornerRadius = 16
        textField.isHidden = true
        return textField
    }()
    
    public let nicknameNextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendardBold(size: 20)
        button.backgroundColor = .SOPTGreen
        button.layer.cornerRadius = 16
        button.isHidden = true
        return button
    }()
    
    private var splashView = SplashView()
    
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
extension OnboardingNicknameView {
    private func setUI() {
        self.backgroundColor = .black
        showSplashScreenView()
    }
    
    private func setHierarchy() {
        self.addSubviews(splashView, nicknameLabel,
                         nicknameTextField,
                         nicknameNextButton)
    }
    
    private func setLayout() {
        splashView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(189)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
        
        nicknameNextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(29)
            $0.height.equalTo(60)
        }
    }
    
    private func showSplashScreenView() {
        UIView.animate(withDuration: 1.5, delay: 1.0, options: .curveEaseOut, animations: {
            self.splashView.alpha = 0.0
        }) { (finished) in
            if finished {
                self.splashView.removeFromSuperview()
                self.nicknameLabel.isHidden = false
                self.nicknameTextField.isHidden = false
                self.nicknameNextButton.isHidden = false
            }
        }
    }
    
    private func setAddTarget() {
        nicknameNextButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    
    @objc
    private func isTapped(_ sender: UIButton) {
        switch sender {
        case nicknameNextButton:
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
