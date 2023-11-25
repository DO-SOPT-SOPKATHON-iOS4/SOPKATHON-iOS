//
//  ExampleView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/25/23.
//

import UIKit

import SnapKit

final class ExampleView: UIView {

    // MARK: - Properties
    
    var index: Int = 0
    
    // MARK: - UI Components
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "apple.logo")
        return image
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .TablingPrimary
        button.setTitle("버튼", for: .normal)
        button.layer.cornerRadius = 24
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
extension ExampleView {
    private func setUI() {
        
    }
    
    private func setHierarchy() {

    }
    
    private func setLayout() {

    }
    
    private func setAddTarget() {

    }
    
    @objc
    private func buttonTapped() {
        
    }
    
    private func setRegisterCell() {
        
    }
    
    private func setDataBind() {
        
    }
}
