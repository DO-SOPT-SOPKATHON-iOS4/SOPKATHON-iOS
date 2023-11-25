import UIKit

import SnapKit

class HistoryCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties

    
    // MARK: - UI Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .SOPTBlack
        label.font = .pretendardBold(size: 28)
        return label
    }()
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.image = ImageLiterals.history_level1
        view.backgroundColor = .clear
        return view
    }()
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .SOPTBlack
        return view
    }()
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .SOPTBlack
        label.font = .pretendardRegular(size: 16)
        label.numberOfLines = 0
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .SOPTBlack
        label.font = .pretendardRegular(size: 12)
        return label
    }()
    
    // MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension HistoryCollectionViewCell {
    func setUI() {
        self.contentView.backgroundColor = .SOPTYellow
        self.contentView.layer.cornerRadius = 40
    }
    
    func setHierarchy() {
        self.contentView.addSubviews(titleLabel, image, divider, contentLabel, dateLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(32)
            $0.height.equalTo(39)
            $0.leading.equalToSuperview().inset(20)
        }
        image.snp.makeConstraints{
            $0.top.equalToSuperview().inset(32)
            $0.height.equalTo(39)
            $0.trailing.equalToSuperview().inset(20)
        }
        divider.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        contentLabel.snp.makeConstraints{
            $0.top.equalTo(divider.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        dateLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func bindData(data: GetHistoryData) {
        self.titleLabel.text = data.title
        self.contentLabel.text = data.content
        self.dateLabel.text = data.testedDate
        setColor(title: data.title)
        setImage(title: data.title)
    }
    
    func setColor(title: String) {
        switch title {
        case "어리숙한 귀요미": self.contentView.backgroundColor = .SOPTYellow
        case "말랑한 깜찍이": self.contentView.backgroundColor = .SOPTOrange
        case "성장중인 새싹이": self.contentView.backgroundColor = .SOPTBlue
        case "성숙한 멋쟁이": self.contentView.backgroundColor = .SOPTGreen
        case "진정한 어른이": self.contentView.backgroundColor = .SOPTRed
        default: break
        }
    }
    
    func setImage(title: String) {
        switch title {
        case "어리숙한 귀요미": self.image.image = ImageLiterals.history_level1
        case "말랑한 깜찍이": self.image.image = ImageLiterals.history_level2
        case "성장중인 새싹이": self.image.image = ImageLiterals.history_level3
        case "성숙한 멋쟁이": self.image.image = ImageLiterals.history_level4
        case "진정한 어른이": self.image.image = ImageLiterals.history_level5
        default: break
        }
    }
}
