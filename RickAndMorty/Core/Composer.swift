//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

class Composer{
    
    
    static func charactersListViewController(controller: CharacterListController, searchController: SearchController) -> CharactersListViewController {        
        let vc = CharactersListViewController(controller: controller, searchController: searchController)
        return vc
    }
    
    static func charactersDetailViewController(title: String, controller: CharacterDetailController) -> CharactersDetailViewController {
        let vc = CharactersDetailViewController(title: title, controller: controller)
        return vc
    }
    
    static func resultListViewController(controller: ResultListController) -> ResultListViewController {
        let vc = ResultListViewController(controller: controller)
        return vc
    }

}
