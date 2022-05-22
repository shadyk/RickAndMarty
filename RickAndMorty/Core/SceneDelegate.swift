//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        setupIntitalPage()
    }
    
    func setupIntitalPage() {
        let dummyController = DefaultCharacterListController(characterLoader: DummyCharacterLoader())

        let remoteController = DefaultCharacterListController(characterLoader: RemoteCharacterLoader())
        
        let root = Composer.charactersListViewController(
            controller: remoteController,
            searchController: getDefaultSearchController())
        
        setRootViewControllerForWindow(UINavigationController(rootViewController: root))
    }
    
    private func getDefaultSearchController() -> SearchController{
        let resultListViewController =  Composer.resultListViewController(controller: DefaultResultListController())
        return  SearchController(
            resultVC: resultListViewController,
            characterFilterer: RemoteCharacterFilterer())
    }
    
    private func setRootViewControllerForWindow(_ vc: UIViewController) {
        self.window!.rootViewController = vc
        self.window!.makeKeyAndVisible()
    }
    
}


