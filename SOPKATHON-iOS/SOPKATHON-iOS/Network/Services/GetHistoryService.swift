import Foundation

import Alamofire

class GetHistoryService: BaseService {
    static let shared = GetHistoryService()
    private override init() {}
}

extension GetHistoryService {
    
    func getHistoryAPI(memberId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URLConstant.resultURL + "/\(memberId)"
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
                                                    [GetHistoryData].self)
               completion(networkResult)
           case .failure:
               completion(.networkFail)
           }
       }
   }
}

