//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation
import BSWFoundation

public class MockRickAndMortyAPIClient: RickAndMortyAPIClient {
    public init () {
        super.init(environment: RickAndMortyAPI.Environment.production)
    }
    
    public override func fetchCharacters(page: Int) async throws -> CharacterResponse {
        .mock
    }
}
