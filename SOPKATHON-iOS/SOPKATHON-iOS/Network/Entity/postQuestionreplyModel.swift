//
//  postQuestionreplyModel.swift
//  SOPKATHON-iOS
//
//  Created by Woo Jye Lee on 11/26/23.
//

import Foundation

// MARK: - Welcome
struct postQuestionreplyModel: Codable {
    let nickname: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let questionId: Int
    let answerType: Bool

    enum CodingKeys: String, CodingKey {
        case questionId = "questionId"
        case answerType
    }
}
