import UIKit


import SnapKit

class HistoryViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let historyView = HistoryView()
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .SOPTWhite
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "그땐 몇살이었지?"
        label.textColor = .white
        label.font = .pretendardBold(size: 20)
        return label
    }()
    private lazy var mainBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: ImageLiterals.ic_left_arrow, style: .done, target: self, action: #selector(goToMain))
        btn.tintColor = .SOPTGrey600
        return btn
    }()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = titleView
        self.navigationItem.leftBarButtonItem = mainBtn
        self.navigationController?.navigationBar.barTintColor = .SOPTBlack
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationController?.navigationBar.backgroundColor = .SOPTBlack
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
    
    @objc
    func goToMain(){
        
    }
}

// MARK: - Extensions
extension HistoryViewController {
    func setUI() {
        
    }
    
    func setHierarchy() {
        titleView.addSubview(titleLabel)

    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    func setDelegate() {
        
    }
}
