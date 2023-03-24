

import Foundation
struct Name_translations : Codable {
	let en : String?

	enum CodingKeys: String, CodingKey {

		case en = "en"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		en = try values.decodeIfPresent(String.self, forKey: .en)
	}

}
