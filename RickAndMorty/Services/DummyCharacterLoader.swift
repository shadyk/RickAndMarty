//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

class DummyCharacterLoader: CharacterLoader {

    func getCharacters(success: @escaping CharacterDetailCompletion, fail: @escaping ErrorHandler) {
        let chars = [
            CharacterViewModel(name: "sadf", status: "asdf", species: "asdf", gender: "asdf", location: Location(name: "sadf", url: "asdf"), image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", numberOfEpisodes: 33),
            CharacterViewModel(name: "111", status: "111", species: "111", gender: "111", location: Location(name: "11", url: "111"), image: "https://rickandmortyapi.com/api/character/avatar/363.jpeg", numberOfEpisodes: 11)
        ]
        success(chars)
    }
}
