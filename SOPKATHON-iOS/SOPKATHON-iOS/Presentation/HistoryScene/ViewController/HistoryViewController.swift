import UIKit


import SnapKit

class HistoryViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let historyView = HistoryView()
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "그땐 몇살이었지?"
        label.textColor = .white
        return label
    }()
    private lazy var mainBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(named: "Q1_ic_left_arrow"), style: .done, target: self, action: #selector(goToMain))
        btn.tintColor = UIColor(hex: "#6F6F6F")
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
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationController?.navigationBar.backgroundColor = .black
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
