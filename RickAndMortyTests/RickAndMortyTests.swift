//
//  Created by Shady
//  All rights reserved.
//  

import XCTest
@testable import RickAndMorty

class RickAndMortyTests: XCTestCase {

    var sut: SceneDelegate!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SceneDelegate()
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }


    func testExample() {
        sut.window = UIWindow()
        
        sut.setupIntitalPage()
        
        let root = sut.window?.rootViewController
        let rootNavigation = root as? UINavigationController
        let topController = rootNavigation?.topViewController
        
        XCTAssertNotNil(rootNavigation, "Expected a navigation controller as root, got \(String(describing: root)) instead")
        XCTAssertTrue(topController is CharactersListViewController, "Expected a CharactersListViewController as top view controller, got \(String(describing: topController)) instead")
    }

}
