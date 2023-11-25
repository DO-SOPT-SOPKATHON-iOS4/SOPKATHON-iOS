import UIKit

import SnapKit

final class SplashView: UIView {

    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private lazy var bgView = UIImageView(image: ImageLiterals.splash_graphic_background)
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "너 몇 살이야?"
        label.textColor = .white
        label.font = .chab(size: 32)
        return label
    }()
    private lazy var character = UIImageView(image: ImageLiterals.splash_character)

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
extension SplashView {
    
    func setUI() {
    }
    
    func setHierarchy() {
        self.addSubview(bgView)
        bgView.addSubviews(character, titleLabel)
    }
    
    func setLayout() {
        bgView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        character.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(324 * UIScreen.main.bounds.height / 812)
        }
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(character.snp.bottom).offset(13)
        }
    }

}
