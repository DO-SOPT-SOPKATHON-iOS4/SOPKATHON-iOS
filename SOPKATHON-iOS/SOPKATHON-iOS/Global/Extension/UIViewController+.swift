//
//  UIViewController+.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

//import UIKit
//
//extension ViewController {
//    func setKeyboardObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc func keyboardWillShow(_ notification: Notification) {
//        // 키보드가 올라왔을 때 실행할 코드
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            // 키보드 높이를 이용해 필요한 UI 조정 등 수행
//            // 예: ScrollView를 이용해 텍스트 필드가 가려지지 않도록 조정하는 등
//        }
//    }
//
//    @objc func keyboardWillHide(_ notification: Notification) {
//        // 키보드가 사라질 때 실행할 코드
//        // 필요한 경우, UI를 원래 상태로 돌려놓는 등의 작업을 수행
//    }
//}
