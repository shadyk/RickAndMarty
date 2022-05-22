//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

struct CharacterViewModel{
    var name: String
    var status: String
    var species: String
    var gender: String
    var location: Location
    var image: String
    var numberOfEpisodes: Int
}

extension RemoteCharacter{
    var toCharacterViewModel: CharacterViewModel{
        return CharacterViewModel(name: name,
                                  status: status,
                                  species: species,
                                  gender: gender,
                                  location: location,
                                  image: image,
                                  numberOfEpisodes: episode.count)
    }
    
}
