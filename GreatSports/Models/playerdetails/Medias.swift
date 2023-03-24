

import Foundation
struct Medias : Codable {
	let preview : String?
	let video : String?
	let title : String?
	let subtitle : String?
	let date : String?

	enum CodingKeys: String, CodingKey {

		case preview = "preview"
		case video = "video"
		case title = "title"
		case subtitle = "subtitle"
		case date = "date"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		preview = try values.decodeIfPresent(String.self, forKey: .preview)
		video = try values.decodeIfPresent(String.self, forKey: .video)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		date = try values.decodeIfPresent(String.self, forKey: .date)
	}

}
