//
//  MainViewController.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = MainView()
    
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
extension MainViewController {
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
extension MainViewController {
    private func getAPI() {
        
    }
}

extension MainViewController: MainButtonDelegate {
    func startQuestionButtonTapped() {
//        self.navigationController?.pushViewController(QuestionViewController(), animated: true)
    }
    
    func historyButtonTapped() {
        self.navigationController?.pushViewController(HistoryViewController(), animated: true)
    }
}
