import Foundation


struct GetHistoryData: Codable {
    let id, resultAge: Int
    let title, content, testedDate: String
    let imgUrl1, imgUrl2: String
}
