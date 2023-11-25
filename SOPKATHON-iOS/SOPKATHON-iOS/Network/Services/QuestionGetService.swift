//
//  QuestionGetService.swift
//  SOPKATHON-iOS
//
//  Created by 고아라 on 2023/11/26.
//

import Foundation

import Alamofire

final class QuestionGetService: BaseService {
    
    static let shared = QuestionGetService()
    
    private override init() {}
}

extension QuestionGetService {
    func getQueestionListAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URLConstant.questionURL
        let header: HTTPHeaders = NetworkConstant.header
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     [QuestionListEntity].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
