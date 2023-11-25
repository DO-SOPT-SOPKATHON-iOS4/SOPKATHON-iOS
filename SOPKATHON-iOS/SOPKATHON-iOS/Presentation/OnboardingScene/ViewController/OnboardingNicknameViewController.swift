//
//  OnboardingNicknameViewController.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

final class OnboardingNicknameViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = OnboardingNicknameView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension OnboardingNicknameViewController {
    private func setUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setHierarchy() {
        
    }
    
    private func setLayout() {
        
    }
    
    private func setDelegate() {
        rootView.buttonDelegate = self
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height - 29, right: 0)
            UIView.animate(withDuration: 0.4) {
                self.rootView.nicknameNextButton.transform = .init(translationX: 0, y: -contentInsets.bottom)
            }
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        print("keyboardWillHide")
        UIView.animate(withDuration: 0.4) {
            self.rootView.nicknameNextButton.transform = .identity
        }
    }
}

extension OnboardingNicknameViewController: UITextFieldDelegate {
    
    // UITextFieldDelegate 메서드 - 입력 시작시
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor // 입력 중일 때의 테두리 색 설정
    }
    
    // UITextFieldDelegate 메서드 - 입력 종료시
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor // 입력 종료 후 기본 테두리 색으로 설정
    }
}

// MARK: - Network

extension OnboardingNicknameViewController {
    private func getAPI() {
        
    }
}

extension OnboardingNicknameViewController: ButtonDelegate {
    func nextButtonTapped() {
        let onBoardingAgeVC = OnboardingAgeViewController()
        onBoardingAgeVC.nickname = rootView.nicknameTextField.text ?? ""
        self.navigationController?.pushViewController(onBoardingAgeVC, animated: true)
    }
}
