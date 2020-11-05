//
//  MovieClient.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import Alamofire
import Foundation

protocol Fetcher {
    func fetchMovies(handler: @escaping([Movies]) -> ())
}

struct MovieClient: Fetcher {
    
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    func fetchMovies(handler: @escaping ([Movies]) -> ()) {
        AF.request(Path.baseURL, method: .get, parameters: nil).responseDecodable(of: DataResponse.self, queue: utilityQueue) { (decodable) in
            switch decodable.result {
            case .success(let result):
                handler(result.search ?? [])
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}


enum Path {
    
    static var searchText = "fast"
    static var baseURL: URL {
        return URL(string: "https://www.omdbapi.com/?s=\(Path.searchText)&apikey=\(Path.getApiKey())")!
    }
    
    static func getApiKey() -> String {
        let apiKey = ApiKey()
        return apiKey.movieApiKey
    }
}


struct ApiKey: Codable {
    
    var movieApiKey: String = ""
    
    private mutating func getApiKey() {
        if  let path = Bundle.main.path(forResource: "API", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let preferences = try? PropertyListDecoder().decode(ApiKey.self, from: xml) {
            self.movieApiKey = preferences.movieApiKey
        }
    }
    
    init() {
        getApiKey()
    }
}
