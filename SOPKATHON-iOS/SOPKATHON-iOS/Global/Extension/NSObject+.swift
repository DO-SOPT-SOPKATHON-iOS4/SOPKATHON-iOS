//
//  NSObject+.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import Foundation

extension NSObject {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
