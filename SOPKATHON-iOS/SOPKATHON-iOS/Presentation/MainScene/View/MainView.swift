//
//  MainView.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 2023/11/26.
//

import UIKit

import SnapKit

protocol MainButtonDelegate: AnyObject {
    func startQuestionButtonTapped()
    func historyButtonTapped()
}

// MARK: - Properties
final class MainView: UIView {

    // MARK: - Properties
    weak var buttonDelegate: MainButtonDelegate?
    
    // MARK: - UI Components
    let mainLaunchScreenView = MainLaunchScreenView()
    
    public let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .SOPTWhite
        label.font = .chab(size: 32)
        label.numberOfLines = 2
        return label
    }()
    
    private let mainStartQuestionView: MainStartQuestionView =  {
        let view = MainStartQuestionView()
        view.backgroundColor = .SOPTBlue
        view.layer.cornerRadius = 60
        return view
    }()
    
    private let mainHistoryView: MainHistoryView = {
        let view = MainHistoryView()
        view.backgroundColor = .SOPTGreen
        view.layer.cornerRadius = 60
        return view
    }()
    
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
extension MainView {
    private func setUI() {
        self.backgroundColor = .black
        self.mainTitleLabel.isHidden = true
        self.mainStartQuestionView.isHidden = true
        self.mainHistoryView.isHidden = true
        showMainLaunchScreenView()
        
    }
    
    func setDataBind(model: OnboardingEntity) {
        mainTitleLabel.text = "\(model.nickName),\n너 몇살이야?"
    }
    
    private func setHierarchy() {
        self.addSubviews(mainLaunchScreenView,
                         mainTitleLabel,
                         mainStartQuestionView,
                         mainHistoryView)
    }
    
    private func setLayout() {
        mainLaunchScreenView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(39)
            $0.leading.equalToSuperview().inset(20)
        }
        
        mainStartQuestionView.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(264)
        }
        
        mainHistoryView.snp.makeConstraints {
            $0.top.equalTo(mainStartQuestionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(229)
        }
        
        
    }
    
    private func setAddTarget() {
        let startTapGesture = UITapGestureRecognizer(target: self, action: #selector(startQuestionViewTapped))
        mainStartQuestionView.addGestureRecognizer(startTapGesture)
        
        let historyTapGesture = UITapGestureRecognizer(target: self, action: #selector(historyViewTapped))
        mainHistoryView.addGestureRecognizer(historyTapGesture)
    }
    
    private func showMainLaunchScreenView() {
        UIView.animate(withDuration: 0.5, delay: 2.0, options: .curveEaseOut, animations: {
            self.mainLaunchScreenView.alpha = 0.0
        }) { (finished) in
            if finished {
                self.mainLaunchScreenView.removeFromSuperview()
                self.mainTitleLabel.isHidden = false
                self.mainStartQuestionView.isHidden = false
                self.mainHistoryView.isHidden = false
            }
        }
    }
    
//    @objc
//    private func isTapped(_ sender: UIButton) {
//        switch sender {
//        case startButton:
//            buttonDelegate?.nextButtonTapped()
//        default:
//            break
//        }
//    }
    
    @objc
    private func startQuestionViewTapped() {
        buttonDelegate?.startQuestionButtonTapped()
    }
    
    @objc
    private func historyViewTapped() {
        buttonDelegate?.historyButtonTapped()
    }
    
    @objc
    private func buttonTapped() {
        
    }
    
    private func setRegisterCell() {
        
    }
    
    private func setDataBind() {
        
    }
}
