//
//  CardEntity.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

struct CardEntity: Codable {
    let nickname: String
    let resultAge: Int
    let title, content: String
    let imgURL: String
    
    enum CodingKeys: String, CodingKey {
        case nickname, resultAge, title, content
        case imgURL = "imgUrl"
    }
}
