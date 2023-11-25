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
        view.backgroundColor = .SOPTYellow
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .SOPTBlack
        image.layer.cornerRadius = 30
        return image
    }()
    
    private let detailTitle: UILabel = {
        let label = UILabel()
        label.text = "당신은"
        label.numberOfLines = 1
        label.font = .pretendardBold(size: 20)
        label.textColor = .SOPTBlack
        label.textAlignment = .center
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "어리숙한 귀요미"
        label.numberOfLines = 1
        label.textColor = .SOPTBlack
        label.textAlignment = .center
        label.font = .pretendardBold(size: 32)
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "13살"
        label.textColor = .SOPTBlack
        label.textAlignment = .center
        label.font = .pretendardBold(size: 28)
        return label
    }()
    
    private let touchLabel: UILabel = {
        let label = UILabel()
        label.text = "카드를 터치해주세요!"
        label.textColor = .SOPTGrey400
        label.font = .pretendardBold(size: 20)
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
        frontView.layer.cornerRadius = 50
        backgroundColor = .SOPTBlack
    }
    
    func setHierarchy() {
        frontView.addSubviews(imageView, detailTitle, detailLabel, seperatorView, ageLabel)
        addSubviews(frontView, touchLabel)
    }
    
    func setLayout() {
        frontView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(31)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(305)
            $0.height.equalTo(441)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(245)
        }
        
        detailTitle.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(detailTitle.snp.bottom)
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
        
        touchLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(130)
        }
    }
    
    func setDataBind(model: CardEntity) {
        imageView.kfSetImage(url: model.imgURL)
        detailLabel.text = model.nickname
        ageLabel.text = "\(model.resultAge)살"
    }
    
    func setHistoryBind(model: GetHistoryData) {
        switch model.title {
        case "어리숙한 귀요미":
            self.frontView.backgroundColor = .SOPTYellow
        case "말랑한 깜찍이":
            self.frontView.backgroundColor = .SOPTOrange
        case "성장중인 새싹이":
            self.frontView.backgroundColor = .SOPTBlue
        case "성숙한 멋쟁이":
            self.frontView.backgroundColor = .SOPTGreen
        case "진정한 어른이":
            self.frontView.backgroundColor = .SOPTRed
        default: break
        }
        imageView.kfSetImage(url: model.imgUrl1)
        detailLabel.text = model.title
        ageLabel.text = "\(model.resultAge)살"
    }
}

