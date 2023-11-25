import UIKit

import SnapKit

final class HistoryView: UIView {

    // MARK: - Properties
    
//    var index: Int = 0
    
    // MARK: - UI Components
    
    private lazy var homeBtn: UIButton = {
       let btn = UIButton()
//        btn.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        btn.backgroundColor = .systemGray2
        return btn
    }()
    private lazy var historyCardView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
//    private let imageView: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        image.image = UIImage(systemName: "apple.logo")
//        return image
//    }()
//
//    private lazy var button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .TablingPrimary
//        button.setTitle("버튼", for: .normal)
//        button.layer.cornerRadius = 24
//        return button
//    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
        setCollectionViewLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension HistoryView {
    func setUI() {
        historyCardView.backgroundColor = .black
    }
    
    func setHierarchy() {
        self.addSubview(historyCardView)
    }
    
    func setLayout() {
        historyCardView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(55)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        HistoryCollectionViewCell.register(collectionView: historyCardView)
        historyCardView.delegate = self
        historyCardView.dataSource = self
    }
    
    func setDataBind() {
        
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 316 * UIScreen.main.bounds.width / 375, height: 256 * UIScreen.main.bounds.width / 375)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        self.historyCardView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

extension HistoryView: UICollectionViewDelegate {}

extension HistoryView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let historyCell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.reuseIdentifier, for: indexPath) as? HistoryCollectionViewCell else {return UICollectionViewCell()}
            historyCell.bindData()
            return historyCell
    }
    
    
}

