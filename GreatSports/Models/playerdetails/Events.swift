
import Foundation
struct Events : Codable {
	let league_name : String?
	let league_logo : String?
	let league_slug : String?
	let matches : [Matches]?

	enum CodingKeys: String, CodingKey {

		case league_name = "league_name"
		case league_logo = "league_logo"
		case league_slug = "league_slug"
		case matches = "matches"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		league_name = try values.decodeIfPresent(String.self, forKey: .league_name)
		league_logo = try values.decodeIfPresent(String.self, forKey: .league_logo)
		league_slug = try values.decodeIfPresent(String.self, forKey: .league_slug)
		matches = try values.decodeIfPresent([Matches].self, forKey: .matches)
	}

}
