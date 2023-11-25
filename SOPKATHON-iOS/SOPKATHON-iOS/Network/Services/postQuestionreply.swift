//
//  postQuestionreply.swift
//  SOPKATHON-iOS
//
//  Created by Woo Jye Lee on 11/26/23.
//

import Foundation
import Alamofire

class postQuestionreply: BaseService {
    static let shared = postQuestionreply()
    private override init() {}
    
    func postInviteAPI(nickname: String,
                       result: [Result],
                       completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URLConstant.resultURL
        let header: HTTPHeaders = NetworkConstant.header
        let param = postQuestionreplyModel(nickname: nickname, results: result)
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: param,
                                     encoder: JSONParameterEncoder.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                dump(data)
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     CardEntity.self)
                completion(networkResult)
            case .failure:
                dump(response)
                completion(.networkFail)
            }
        }
    }
    
}
