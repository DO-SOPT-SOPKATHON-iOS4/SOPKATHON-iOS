//
//  CardEntity.swift
//  SOPKATHON-iOS
//
//  Created by Woo Jye Lee on 11/26/23.

//

struct CardEntity: Codable {
    let nickname: String
    let resultAge: Int
    let title, content: String
    let imgURL1: String
    let imgURL2: String
    
    enum CodingKeys: String, CodingKey {
        case nickname, resultAge, title, content
        case imgURL1 = "imgUrl1"
        case imgURL2 = "imgUrl2"
    }
}
