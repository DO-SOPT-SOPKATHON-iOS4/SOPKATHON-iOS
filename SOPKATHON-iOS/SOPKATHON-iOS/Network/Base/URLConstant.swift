//
//  URLConstant.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import Foundation

enum URLConstant {
    
    // MARK: - Base URL
    
    static let baseURL = Config.baseURL

    static let questionURL = baseURL + "/question"
    
    static let memberURL = baseURL + "/member"
    
    static let resultURL = baseURL + "/result"
}
