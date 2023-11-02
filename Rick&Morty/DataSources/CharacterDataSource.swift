//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation
import Rick_MortyKit

@MainActor
public class CharacterDataSource: ObservableObject {
    
    //MARK: Init for the rest of the APP
    public init(apiClient: RickAndMortyAPIClient) async throws {
        self.apiClient = apiClient
        characters = try await apiClient.fetchCharacters(page: 1).viewModel()
    }
    
    //MARK: Init for Previews and Testing
    private init(characters: [CharacterViewModel]) {
        self.apiClient = MockRickAndMortyAPIClient()
        self.characters = characters
    }
    
    let apiClient: RickAndMortyAPIClient
    
    @Published
    public var characters: [CharacterViewModel]
}

extension CharacterDataSource {
    static var mock: CharacterDataSource {
        CharacterDataSource(characters: [.mockCharacter1, .mockCharacter2, .mockCharacter3, .mockCharacter4, .mockCharacter5, .mockCharacter6])
    }
}

extension CharacterResponse {
    func viewModel() -> [CharacterViewModel] {
        return self.results.map { character in
            return CharacterViewModel(
                id: character.id,
                name: character.name,
                status: character.status,
                species: character.species,
                type: character.type,
                gender: character.gender,
                origin: character.origin,
                location: character.location,
                imageURL: URL(string: character.image),
                episodes: character.episode,
                url: character.url, 
                created: character.created
            )
        }
    }
}
