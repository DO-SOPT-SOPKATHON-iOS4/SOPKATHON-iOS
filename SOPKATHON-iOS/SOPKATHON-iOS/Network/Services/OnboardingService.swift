//
//  OnboardingService.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/26/23.
//

import Foundation
import Alamofire

final class OnboardingService: BaseService {
    
    static let shared = OnboardingService()
    
    private override init() {}
}

extension OnboardingService {
    func getOnboardingAPI(nickname: String, age: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URLConstant.memberURL
        let header: HTTPHeaders = NetworkConstant.header
        let body: Parameters = [
            "nickName": nickname,
            "age" : age
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     OnboardingEntity.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
