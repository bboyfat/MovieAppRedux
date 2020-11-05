//
//  Model.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import Foundation

struct DataResponse: Decodable {
    
    var response: Bool?
    var search: [Movies]?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case search = "Search"
    }
    
    init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
          self.response = try? container.decode(Bool.self, forKey: .response)
          self.search = try? container.decode([Movies].self, forKey: .search)
     }

}

struct Movies: Decodable {
    
    var poster: String?
    var title: String?
    var type: String?
    var year: String?
    var imdbID: String?
    
    enum CodingKeys: String, CodingKey {
        case poster = "Poster"
        case title = "Title"
        case type = "Type"
        case year = "Year"
        case imdbID = "imdbID"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.poster = try? container.decode(String.self, forKey: .poster)
        self.title = try? container.decode(String.self, forKey: .title)
        self.type = try? container.decode(String.self, forKey: .type)
        self.year = try? container.decode(String.self, forKey: .year)
        self.imdbID = try? container.decode(String.self, forKey: .imdbID)
        
    }
}
