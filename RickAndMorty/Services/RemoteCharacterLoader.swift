//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

typealias CharacterDetailCompletion = ([CharacterViewModel]) -> Void

class RemoteCharacterLoader: CharacterLoader { 
    private let endpoint  = "/api/character"

    func getCharacters(success: @escaping CharacterDetailCompletion, fail: @escaping ErrorHandler) {
        HttpRequester().get(endPoint: endpoint, remoteObject: RemoteCharacterResponse.self) { response in
            let remoteCharacters = response.results
            success(remoteCharacters.map{ $0.toCharacterViewModel } )
        } fail: { fail($0) }
    }
}


