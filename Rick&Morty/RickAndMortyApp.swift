//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    var current = World()
    
    var body: some Scene {
        WindowGroup {
            CharacterListView.Async(apiClient: current.apiClient)
        }
    }
}
