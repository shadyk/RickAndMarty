//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

protocol CharacterDetailController {
    var character: CharacterViewModel { get set}
    var imageLoader: CharacterImageLoader { get set}
    func getDetails() -> [DetailsTableCelllController]
}


class DefaultCharacterDetailController: CharacterDetailController{
    var character: CharacterViewModel
    var imageLoader: CharacterImageLoader
    
    init(character: CharacterViewModel, imagaLoader: CharacterImageLoader) {
        self.character = character
        self.imageLoader = imagaLoader
    }
    
    func getDetails() -> [DetailsTableCelllController] {
        
        var detailsVMs = [DetailViewModel]()
        detailsVMs.append(DetailViewModel(title: Localizable.NAME_DETAIL,
                                          value: character.name))
        detailsVMs.append(DetailViewModel(title: Localizable.STATUS_DETAIL,
                                          value: character.status))
        detailsVMs.append(DetailViewModel(title: Localizable.SPECIES_DETAIL,
                                          value: character.species))
        detailsVMs.append(DetailViewModel(title: Localizable.GENDER_DETAIL,
                                          value: character.gender))
        detailsVMs.append(DetailViewModel(title: Localizable.LOCATION_DETAIL,
                                          value: character.location.name))
        
        return detailsVMs.map{ DetailsTableCelllController(viewModel: $0)}

    }
    
}
