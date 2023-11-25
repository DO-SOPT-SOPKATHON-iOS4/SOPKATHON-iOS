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
        view.backgroundColor = .SOPTYellow
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private let backTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "어리숙한 귀요미"
        label.textColor = .SOPTBlack
        label.font = .pretendardBold(size: 32)
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
        label.font = .pretendardRegular(size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let touchLabel: UILabel = {
        let label = UILabel()
        label.text = "카드를 터치해주세요!"
        label.textColor = .SOPTGrey400
        label.font = .pretendardBold(size: 20)
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
        backView.layer.cornerRadius = 50
        backgroundColor = .SOPTBlack
    }
    
    func setHierarchy() {
        backView.addSubviews(imageView, backTitleLabel, seperatorView, backContentLabel)
        addSubviews(backView, touchLabel)
    }
    
    func setLayout() {
        backView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(31)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(305)
            $0.height.equalTo(441)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(83)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(36)
            $0.height.equalTo(54)
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
        
        touchLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(130)
        }
    }
    
    func setDataBind(model: CardEntity) {
        imageView.kfSetImage(url: model.imgURL)
        backTitleLabel.text = model.title
        backContentLabel.text = model.content
    }
    
    func setHistoryBind(title: String, content: String) {
        switch title {
        case "어리숙한 귀요미":
            self.imageView.image = ImageLiterals.history_level1
            self.backView.backgroundColor = .SOPTYellow
            self.imageView.snp.updateConstraints {
                $0.width.equalTo(54)
                $0.height.equalTo(36)
            }
        case "말랑한 깜찍이":
            self.imageView.image = ImageLiterals.history_level2
            self.backView.backgroundColor = .SOPTOrange
            self.imageView.snp.updateConstraints {
                $0.width.equalTo(54)
                $0.height.equalTo(36)
            }
        case "성장중인 새싹이":
            self.imageView.image = ImageLiterals.history_level3
            self.backView.backgroundColor = .SOPTBlue
            self.imageView.snp.updateConstraints {
                $0.width.equalTo(54)
                $0.height.equalTo(36)
            }
        case "성숙한 멋쟁이":
            self.imageView.image = ImageLiterals.history_level4
            self.backView.backgroundColor = .SOPTGreen
        case "진정한 어른이":
            self.backView.backgroundColor = .SOPTRed
            self.imageView.image = ImageLiterals.history_level5
        default: break
        }
        backTitleLabel.text = title
        backContentLabel.text = content
    }
}
