/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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