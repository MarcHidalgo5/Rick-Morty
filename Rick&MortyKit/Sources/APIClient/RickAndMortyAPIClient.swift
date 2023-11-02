//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation
import BSWFoundation

public class RickAndMortyAPIClient: APIClient {
    
    public override init(environment: Environment, networkFetcher: APIClientNetworkFetcher? = nil) {
        super.init(environment: environment, networkFetcher: networkFetcher)
    }
    
    public func fetchCharacters(page: Int) async throws -> CharacterResponse {
        let request = Request<CharacterResponse>(endpoint: CharacterAPI.fetchCharacter(page: page))
        return try await perform(request)
    }
}
