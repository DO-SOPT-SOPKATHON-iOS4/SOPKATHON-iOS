//
//  OnboardingAgeViewController.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

final class OnboardingAgeViewController: UIViewController {

    // MARK: - Properties
    var nickname: String = ""
    
    // MARK: - UI Components
    
    private let rootView = OnboardingAgeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("OnboardingAgeViewController: \(nickname)")
        getOnboardingAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}


// MARK: - Extensions
extension OnboardingAgeViewController {
    private func setUI() {
        self.navigationController?.navBackButton()
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
                self.rootView.startButton.transform = .init(translationX: 0, y: -contentInsets.bottom)
            }
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.4) {
            self.rootView.startButton.transform = .identity
        }
    }
}

// MARK: - Network

extension OnboardingAgeViewController {
    private func getOnboardingAPI() {
        
    }
}

extension OnboardingAgeViewController: ButtonDelegate {
    func nextButtonTapped() {
        let mainVC = MainViewController()
        mainVC.nickname = nickname
        mainVC.age = Int(rootView.ageTextField.text ?? "") ?? 0
        print("Main VC: \(mainVC.age)")
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
}
