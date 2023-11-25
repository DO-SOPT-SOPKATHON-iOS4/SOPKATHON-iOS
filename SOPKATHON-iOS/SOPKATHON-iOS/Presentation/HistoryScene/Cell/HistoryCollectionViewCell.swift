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
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "level1")
        view.backgroundColor = .clear
        return view
    }()
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension HistoryCollectionViewCell {
    func setUI() {
        self.contentView.backgroundColor = .gray
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
    
    func bindData() {
        self.titleLabel.text = "당신은 성장중인 새싹이"
        self.contentLabel.text = "매일 매일 자라고 있는 당신! \n다음 달엔 얼마나 발전했을지 궁금한 걸?"
        self.dateLabel.text = "23.12.31"
    }
}
