//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

class RemoteCharacterFilterer: CharacterFilterer {
    private var endpoint  = "/api/character"

    func filterCharacters(name:String, success: @escaping CharacterDetailCompletion, fail: @escaping ErrorHandler) {
        HttpRequester().get(endPoint: endpoint, queryItems: [URLQueryItem(name: "name", value: name)], remoteObject: RemoteCharacterResponse.self) { response in
            let remoteCharacters = response.results
            success(remoteCharacters.map{ $0.toCharacterViewModel } )
        } fail: { fail($0) }
    }
}


