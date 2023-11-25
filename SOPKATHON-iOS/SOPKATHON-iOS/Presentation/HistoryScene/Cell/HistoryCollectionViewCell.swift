import UIKit

import SnapKit

class HistoryCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties

    
    // MARK: - UI Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
        self.contentView.backgroundColor = .gray
    }
    
    func setHierarchy() {
        self.contentView.addSubviews(titleLabel, contentLabel, dateLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(41)
            $0.leading.trailing.equalToSuperview().inset(29)
        }
        contentLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(29)
        }
        dateLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(27)
        }
    }
    
    func bindData() {
        self.titleLabel.text = "당신은 성장중인 새싹이"
        self.contentLabel.text = "매일 매일 자라고 있는 당신! \n다음 달엔 얼마나 발전했을지 궁금한 걸?"
        self.dateLabel.text = "23.12.31"
    }
}
