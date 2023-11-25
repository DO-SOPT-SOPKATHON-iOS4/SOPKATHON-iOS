//
//  MainHistoryView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

class MainHistoryView: UIView {
    
    // MARK: - Properties
//    weak var buttonDelegate: ButtonDelegate?
    
    // MARK: - UI Components
    private let historyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "그땐 몇 살이었지?"
        label.textColor = .white
        return label
    }()
    
    private let historySubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나이 히스토리를 확인해봐요"
        label.textColor = .white
        return label
    }()
    
    private let historyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "folder.fill")
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
extension MainHistoryView {
    private func setUI() {
        self.backgroundColor = .black
    }
    
    private func setHierarchy() {
        self.addSubviews(historyTitleLabel,
                         historySubTitleLabel,
                         historyImageView)
    }
    
    private func setLayout() {
        historyTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(40)
        }
        
        historySubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(historyTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(40)
        }
        
        historyImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(30)
            $0.width.equalTo(50)
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

