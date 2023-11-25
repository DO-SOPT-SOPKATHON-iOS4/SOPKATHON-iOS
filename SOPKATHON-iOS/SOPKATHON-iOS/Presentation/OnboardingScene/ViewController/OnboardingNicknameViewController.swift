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
        
    }
    
    private func setHierarchy() {
        
    }
    
    private func setLayout() {
        
    }
    
    private func setDelegate() {
        rootView.buttonDelegate = self
    }
}

// MARK: - Network

extension OnboardingNicknameViewController {
    private func getAPI() {
        
    }
}

extension OnboardingNicknameViewController: ButtonDelegate {
    func nextButtonTapped() {
        self.navigationController?.pushViewController(OnboardingAgeViewController(), animated: true)
    }
}
