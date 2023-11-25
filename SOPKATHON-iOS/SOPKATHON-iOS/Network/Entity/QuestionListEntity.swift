//
//  QuestionListEntity.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import Foundation

struct QuestionListEntity: Codable {
    let questionID: Int
    let questionContent: String

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case questionContent
    }
}
