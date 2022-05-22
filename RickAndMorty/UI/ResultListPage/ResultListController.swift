//
//  Created by Shady
//  All rights reserved.
//  

import Foundation
import UIKit

protocol ResultListController {
    func didSelect(nav: UINavigationController, character: CharacterViewModel)
}

class DefaultResultListController: ResultListController{
    func didSelect(nav: UINavigationController, character: CharacterViewModel) {
        
        let vc = Composer.charactersDetailViewController(title: character.name, controller: DefaultCharacterDetailController(character: character, imagaLoader: RemoteImageLoader()))
        nav.pushViewController(vc, animated: true)
    }
}
