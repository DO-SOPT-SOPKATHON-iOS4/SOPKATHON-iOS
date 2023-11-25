//
//  CardView.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

import SnapKit

final class CardFrontView: UIView {
    
    // MARK: - UI Components
    
    let frontView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "apple.logo")
        return image
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "당신은\n어리숙한 귀요미"
        label.numberOfLines = 2
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "dd살"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let touchLabel: UILabel = {
        let label = UILabel()
        label.text = "카드를 터치해주세요!"
        label.textColor = .black
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension CardFrontView {
    func setUI() {
        backgroundColor = .blue
    }
    
    func setHierarchy() {
        frontView.addSubviews(imageView, detailLabel, seperatorView, ageLabel)
        addSubview(frontView)
    }
    
    func setLayout() {
        frontView.snp.makeConstraints {
//            $0.top.equalTo(safeAreaLayoutGuide).offset(31)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(305)
//            $0.height.equalTo(441)
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(245)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(1)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

