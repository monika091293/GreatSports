

import Foundation
struct PlayerDat : Codable {
	let player_id : String?
	let player_photo : String?
	let player_name : String?
	let player_country : String?
	let team_photo : String?
	let team_name : String?
	let team_slug : String?
	let indicators : [Indicators]?
	let rating : [Rating]?
	let statistics : [Statistics]?
	let about : String?
	let events : [Events]?
	let medias : [Medias]?

	enum CodingKeys: String, CodingKey {

		case player_id = "player_id"
		case player_photo = "player_photo"
		case player_name = "player_name"
		case player_country = "player_country"
		case team_photo = "team_photo"
		case team_name = "team_name"
		case team_slug = "team_slug"
		case indicators = "indicators"
		case rating = "rating"
		case statistics = "statistics"
		case about = "about"
		case events = "events"
		case medias = "medias"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		player_id = try values.decodeIfPresent(String.self, forKey: .player_id)
		player_photo = try values.decodeIfPresent(String.self, forKey: .player_photo)
		player_name = try values.decodeIfPresent(String.self, forKey: .player_name)
		player_country = try values.decodeIfPresent(String.self, forKey: .player_country)
		team_photo = try values.decodeIfPresent(String.self, forKey: .team_photo)
		team_name = try values.decodeIfPresent(String.self, forKey: .team_name)
		team_slug = try values.decodeIfPresent(String.self, forKey: .team_slug)
		indicators = try values.decodeIfPresent([Indicators].self, forKey: .indicators)
		rating = try values.decodeIfPresent([Rating].self, forKey: .rating)
		statistics = try values.decodeIfPresent([Statistics].self, forKey: .statistics)
		about = try values.decodeIfPresent(String.self, forKey: .about)
		events = try values.decodeIfPresent([Events].self, forKey: .events)
		medias = try values.decodeIfPresent([Medias].self, forKey: .medias)
	}

}
