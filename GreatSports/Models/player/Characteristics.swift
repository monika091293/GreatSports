

import Foundation
struct Characteristics : Codable {
	let positive : [Positive]?
	let negative : [Negative]?

	enum CodingKeys: String, CodingKey {

		case positive = "positive"
		case negative = "negative"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		positive = try values.decodeIfPresent([Positive].self, forKey: .positive)
		negative = try values.decodeIfPresent([Negative].self, forKey: .negative)
	}

}
