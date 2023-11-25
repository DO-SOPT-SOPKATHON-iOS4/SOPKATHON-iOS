//
//  MainViewController.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties
    var nickname: String?
    var age: Int?
    var memberData: OnboardingEntity = OnboardingEntity(memberID: 0, nickName: "", realAge: 0)
    
    // MARK: - UI Components
    
    private let rootView = MainView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("MainViewController: \(nickname)")
//        print("MainViewController: \(age)")
        
        getOnboardingAPI(nickname: nickname ?? "", age: age ?? 0)
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension MainViewController {
    private func setUI() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setHierarchy() {
        
    }
    
    private func setLayout() {
        
    }
    
    private func setDelegate() {
        rootView.buttonDelegate = self
    }
}

// MARK: - Network

extension MainViewController {
    private func getOnboardingAPI(nickname: String, age: Int) {
        OnboardingService.shared.getOnboardingAPI(nickname: nickname, age: age) { networkResult in
            print(networkResult)
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<OnboardingEntity> {
                    if let listData = data.data {
                        self.memberData = listData
                    }
                    DispatchQueue.main.async {
                        self.rootView.mainLaunchScreenView.mainTitleLabel.text = "\(self.memberData.nickName),\n너 정말 \(self.memberData.realAge)살 맞아?"
                        self.rootView.mainLaunchScreenView.mainTitleLabel.partColorChange(targetString: "\(self.memberData.realAge)", textColor: .SOPTOrange)
                        self.rootView.mainTitleLabel.text = "\(self.memberData.nickName),\n너 몇살이야?"
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

extension MainViewController: MainButtonDelegate {
    func startQuestionButtonTapped() {
        self.navigationController?.pushViewController(QuestionViewController(), animated: true)
    }
    
    func historyButtonTapped() {
        self.navigationController?.pushViewController(HistoryViewController(), animated: true)
    }
}
