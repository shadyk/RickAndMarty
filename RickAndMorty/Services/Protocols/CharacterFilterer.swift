//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

protocol CharacterFilterer{
    func filterCharacters(name:String, success: @escaping CharacterDetailCompletion, fail: @escaping ErrorHandler)
}
