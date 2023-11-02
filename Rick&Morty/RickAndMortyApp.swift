//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    init() {
        themeApp()
    }
    
    var current = World()
    
    var body: some Scene {
        WindowGroup {
            CharacterListView.Async(apiClient: current.apiClient)
        }
    }
    
    func themeApp() {
        UIViewController.swizzleBackButton()
        
        //MARK: UINavigationBar
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UIBarButtonItem.appearance().tintColor = .black
    }
}

