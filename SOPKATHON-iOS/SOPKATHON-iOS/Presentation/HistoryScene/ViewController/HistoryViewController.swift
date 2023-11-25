import UIKit


import SnapKit

class HistoryViewController: UIViewController {

    // MARK: - Properties
    private var historyListEntity: [GetHistoryData] = []
//    var protocol: GetHistoryDataProtocol?
    
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
        getHistoryApi(memberId: 1)
    }
    
    @objc
    func goToMain(){
        let nav = MainViewController()
        nav.nickname = "동훈"
        nav.age = 24
        self.navigationController?.pushViewController(nav, animated: false)
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
        historyView.historyCardView.dataSource = self
        historyView.historyCardView.delegate = self
    }
    
    func getHistoryApi(memberId: Int) {
        GetHistoryService.shared.getHistoryAPI(memberId: memberId) { networkResult in
                   print(networkResult)
                   switch networkResult {
                   case .success(let data):
                       if let data = data as? GenericResponse<[GetHistoryData]> {
                           dump(data)
                           if let listData = data.data {
                               self.historyListEntity = listData
                           }
                           DispatchQueue.main.async {
                               self.historyView.historyCardView.reloadData()
                           }
                       }
                   case .requestErr, .serverErr:
                       print("오류발생")
                   default:
                       break
                   }
               }

    }
}

extension HistoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nav = CardFrontViewController()
        nav.cardfront.setHistoryBind(model: historyListEntity[indexPath.item])
        nav.historyTitle = historyListEntity[indexPath.item].title
        nav.historyContent = historyListEntity[indexPath.item].content
        self.present(nav, animated: false)
    }
    
}

extension HistoryViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyListEntity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let historyCell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.reuseIdentifier, for: indexPath) as? HistoryCollectionViewCell else {return UICollectionViewCell()}
        historyCell.bindData(data: historyListEntity[indexPath.row])
//        historyCell.setColor()
            return historyCell
    }
    
    
}

