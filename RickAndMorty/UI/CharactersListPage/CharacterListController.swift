//
//  Created by Shady
//  All rights reserved.
//  

import Foundation
import UIKit

protocol CharacterListController {
    var characterLoader: CharacterLoader { get set }
    func loadCharacters(success: @escaping ([CharacterListCellController]) -> Void,  fail: @escaping ErrorHandler)
    func didSelect(nav: UINavigationController, character: CharacterViewModel)
}


class DefaultCharacterListController: CharacterListController{
    var characterLoader: CharacterLoader
    
    init(characterLoader: CharacterLoader) {
        self.characterLoader = characterLoader
    }
    
    func didSelect(nav: UINavigationController, character: CharacterViewModel) {
        
        let vc = Composer.charactersDetailViewController(title: character.name, controller: DefaultCharacterDetailController(character: character, imagaLoader: RemoteImageLoader()))
        nav.pushViewController(vc, animated: true)
    }
    
    func loadCharacters(success: @escaping ([CharacterListCellController]) -> Void,  fail: @escaping ErrorHandler) {
        self.loadCharactersFromLoader {
            let cellControllers = $0.map {
                CharacterListCellController(viewModel: $0)
            }
            success(cellControllers)
        } fail: { fail($0) }
    }
    
    private func loadCharactersFromLoader(success: @escaping CharacterDetailCompletion,  fail: @escaping ErrorHandler) {
        characterLoader.getCharacters(
            success: { success($0) },
            fail: {  fail($0)})
    }
    
    
}
