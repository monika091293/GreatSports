

import Foundation
struct Positive : Codable {
	let feature : String?
	let value : Int?

	enum CodingKeys: String, CodingKey {

		case feature = "feature"
		case value = "value"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		feature = try values.decodeIfPresent(String.self, forKey: .feature)
		value = try values.decodeIfPresent(Int.self, forKey: .value)
	}

}
