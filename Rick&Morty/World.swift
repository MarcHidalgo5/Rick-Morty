//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation
import Rick_MortyKit

class World {
    
    var apiClient: RickAndMortyAPIClient
    
    init(environemnt: RickAndMortyAPI.Environment = .production) {
        self.apiClient = RickAndMortyAPIClient(environment: environemnt)
    }
}
