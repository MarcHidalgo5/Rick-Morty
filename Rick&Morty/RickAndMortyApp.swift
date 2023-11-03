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
            StartView(apiClient: current.apiClient)
        }
    }
    
    func themeApp() {
        UIViewController.swizzleBackButton()
        
        //MARK: UINavigationBar
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UIBarButtonItem.appearance().tintColor = UIColor(light: .darkText, dark: .white)
    }
}

