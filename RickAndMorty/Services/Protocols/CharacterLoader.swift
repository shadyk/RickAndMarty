//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

protocol CharacterLoader{
    func getCharacters(success: @escaping CharacterDetailCompletion, fail: @escaping ErrorHandler)
}
