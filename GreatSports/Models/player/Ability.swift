

import Foundation
struct Ability : Codable {
	let name : String?
	let value : Int?
	let full_average : Int?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case value = "value"
		case full_average = "full_average"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		value = try values.decodeIfPresent(Int.self, forKey: .value)
		full_average = try values.decodeIfPresent(Int.self, forKey: .full_average)
	}

}
