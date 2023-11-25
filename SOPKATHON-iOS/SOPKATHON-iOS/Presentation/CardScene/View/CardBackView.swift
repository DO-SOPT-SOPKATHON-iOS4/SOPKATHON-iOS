//
//  CardBackView.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import UIKit

import SnapKit

final class CardBackView: UIView {
    
    // MARK: - UI Components
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "apple.logo")
        return image
    }()

    private let backTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "어리숙한 귀요미"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let backContentLabel: UILabel = {
        let label = UILabel()
        label.text = "어리숙한 귀요미\n\ndjdj"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
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

extension CardBackView {
    func setUI() {
        backgroundColor = .red
    }
    
    func setHierarchy() {
        backView.addSubviews(imageView, backTitleLabel, seperatorView, backContentLabel)
        addSubview(backView)
    }
    
    func setLayout() {
        backView.snp.makeConstraints {
//            $0.top.equalTo(safeAreaLayoutGuide).offset(31)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(305)
//            $0.height.equalTo(441)
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(83)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(54)
            $0.height.equalTo(36)
        }
        
        backTitleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(backTitleLabel.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
        }
        
        backContentLabel.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(29)
            $0.leading.trailing.equalToSuperview().inset(39)
        }
    }
}
