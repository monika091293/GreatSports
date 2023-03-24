

import Foundation
struct Team_name_translations : Codable {
	let en : String?
	let ru : String?
	let de : String?
	let es : String?
	let fr : String?
	let zh : String?
	let tr : String?
	let el : String?
	let it : String?
	let nl : String?
	let pt : String?

	enum CodingKeys: String, CodingKey {

		case en = "en"
		case ru = "ru"
		case de = "de"
		case es = "es"
		case fr = "fr"
		case zh = "zh"
		case tr = "tr"
		case el = "el"
		case it = "it"
		case nl = "nl"
		case pt = "pt"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		en = try values.decodeIfPresent(String.self, forKey: .en)
		ru = try values.decodeIfPresent(String.self, forKey: .ru)
		de = try values.decodeIfPresent(String.self, forKey: .de)
		es = try values.decodeIfPresent(String.self, forKey: .es)
		fr = try values.decodeIfPresent(String.self, forKey: .fr)
		zh = try values.decodeIfPresent(String.self, forKey: .zh)
		tr = try values.decodeIfPresent(String.self, forKey: .tr)
		el = try values.decodeIfPresent(String.self, forKey: .el)
		it = try values.decodeIfPresent(String.self, forKey: .it)
		nl = try values.decodeIfPresent(String.self, forKey: .nl)
		pt = try values.decodeIfPresent(String.self, forKey: .pt)
	}

}
