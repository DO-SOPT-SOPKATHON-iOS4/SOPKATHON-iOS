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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension HistoryView {
    func setUI() {
        
    }
    
    func setHierarchy() {
    }
    
    func setLayout() {

    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}

