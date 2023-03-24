
import Foundation
import UIKit

struct Players : Codable {
    let status : Int?
    let message : String?
    let pdata : [PData]?
    let total : Int?
    let per_page : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case pdata = "data"
        case total = "total"
        case per_page = "per_page"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        pdata = try values.decodeIfPresent([PData].self, forKey: .pdata)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
    }

}
