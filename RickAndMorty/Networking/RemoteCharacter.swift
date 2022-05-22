//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

struct RemoteCharacterResponse: Codable {
    var info: RemoteInfo
    var results: [RemoteCharacter]
}
// MARK: - Info
struct RemoteInfo: Codable {
    var count, pages: Int?
    var next, prev: String?
}

struct RemoteCharacter: Codable {
    var id: Int
    var name, status, species, type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

// MARK: - Location
struct Location: Codable {
    var name: String
    var url: String
}

// MARK: - Origin
struct Origin: Codable {
    var name: String
    var url: String
}
