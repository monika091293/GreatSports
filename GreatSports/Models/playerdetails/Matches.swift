

import Foundation
struct Matches : Codable {
	let date : String?
	let home_score : String?
	let away_score : String?
	let home_name : String?
	let away_name : String?
	let slug : String?
	let round : String?

	enum CodingKeys: String, CodingKey {

		case date = "date"
		case home_score = "home_score"
		case away_score = "away_score"
		case home_name = "home_name"
		case away_name = "away_name"
		case slug = "slug"
		case round = "round"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		home_score = try values.decodeIfPresent(String.self, forKey: .home_score)
		away_score = try values.decodeIfPresent(String.self, forKey: .away_score)
		home_name = try values.decodeIfPresent(String.self, forKey: .home_name)
		away_name = try values.decodeIfPresent(String.self, forKey: .away_name)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		round = try values.decodeIfPresent(String.self, forKey: .round)
	}

}
