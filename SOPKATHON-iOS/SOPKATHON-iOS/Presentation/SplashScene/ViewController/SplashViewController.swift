//
//  SplashViewController.swift
//  SOPKATHON-iOS
//
//  Created by 윤희슬 on 2023/11/26.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let bgView = SplashView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = bgView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension SplashViewController {
    
    private func setHierarchy() {
    }
    
    private func setLayout() {
        
    }
    
    private func setDelegate() {
        
    }
}
