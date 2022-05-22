//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class SearchController: UISearchController{
    
    private var searchTask: DispatchWorkItem?
    private var characterFilterer: CharacterFilterer?
    
    convenience init(resultVC: ResultListViewController, characterFilterer: CharacterFilterer){
        self.init(searchResultsController: resultVC)
        self.characterFilterer = characterFilterer
    }
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSearch(text: String?){
        guard let text = text,
              !text.isEmpty else { return }
        
        self.searchTask?.cancel()
        let task = DispatchWorkItem { [weak self] in
            self?.filterByName(name: text)
        }
        self.searchTask = task
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75, execute: task)
    }
    
    private func filterByName(name:String){
        let result = searchResultsController as! ResultListViewController
        self.filterCharacter(name: name,
                             success: { [result] model in
            result.updateInterface(model: model)
        },
                             fail:{ [result] msg in
            result.errorWhileSearching(message: msg) })
    }
    
    private func filterCharacter(name:String,success: @escaping ([CharacterListCellController]) -> Void,  fail: @escaping ErrorHandler) {
        self.loadCharactersFromLoader(name:name) {
            let cellControllers = $0.map {
                CharacterListCellController(viewModel: $0)
            }
            success(cellControllers)
        } fail: { fail($0) }
    }
    
    private func loadCharactersFromLoader(name: String, success: @escaping CharacterDetailCompletion,  fail: @escaping ErrorHandler) {
        characterFilterer?.filterCharacters(
            name: name,
            success: { success($0) },
            fail: {  fail($0) }
        )
    }
    
}

