

import Foundation
struct PlayerDetail : Codable {
	let status : Int?
	let message : String?
	let playerDat : PlayerDat?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case message = "message"
		case playerDat = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		message = try values.decodeIfPresent(String.self, forKey: .message)
        playerDat = try values.decodeIfPresent(PlayerDat.self, forKey: .playerDat)
	}

}
