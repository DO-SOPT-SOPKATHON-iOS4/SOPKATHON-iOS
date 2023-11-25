//
//  OnboardingEntity.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import Foundation

struct OnboardingEntity: Codable {
    let memberID: Int
    let nickName: String
    let realAge: Int

    enum CodingKeys: String, CodingKey {
        case memberID = "memberId"
        case nickName, realAge
    }
}

