//
//  OnboardingAgeViewController.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

final class OnboardingAgeViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = OnboardingAgeView()
    
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
extension OnboardingAgeViewController {
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

extension OnboardingAgeViewController {
    private func getAPI() {
        
    }
}

extension OnboardingAgeViewController: ButtonDelegate {
    func nextButtonTapped() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }
}
