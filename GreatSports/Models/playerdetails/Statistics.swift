
import Foundation
struct Statistics : Codable {
	let league : String?
	let playerDat : [PlayerDat]?

	enum CodingKeys: String, CodingKey {

		case league = "league"
		case playerDat = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		league = try values.decodeIfPresent(String.self, forKey: .league)
        playerDat = try values.decodeIfPresent([PlayerDat].self, forKey: .playerDat)
	}

}
