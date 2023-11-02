//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation
import Rick_MortyKit
import BSWInterfaceKit

@MainActor
public class CharacterDataSource: InfiniteScrollingDataSource<CharacterViewModel> {
    
    //MARK: Init for the rest of the APP
    public init(apiClient: RickAndMortyAPIClient) async throws {
        self.apiClient = apiClient
//        characters = try await apiClient.fetchCharacters(page: 1).viewModel()
        self.pagingHandler = PagingHandler(apiClient: apiClient)
        try await super.init(currentPage: 1) { [unowned pagingHandler] in
            try await pagingHandler.page(pageNumber: $0)
        }
    }
    
    //MARK: Init for Previews and Testing
    private init(characters: [CharacterViewModel]) {
        self.apiClient = MockRickAndMortyAPIClient()
        self.pagingHandler = PagingHandler(apiClient: MockRickAndMortyAPIClient())
        super.init(mockItems: characters)
    }
    
    private var pagingHandler: PagingHandler
    private let apiClient: RickAndMortyAPIClient
}

//MARK: PagingHandler

@MainActor
private extension CharacterDataSource {
   
    class PagingHandler {
        
        private let apiClient: RickAndMortyAPIClient

        
        init(apiClient: RickAndMortyAPIClient) {
            self.apiClient = apiClient
        }
        
        func page(pageNumber: Int) async throws -> ([CharacterViewModel], Bool) {
            let items = try await apiClient.fetchCharacters(page: pageNumber)
            let moreMessagesAvailable = pageNumber <= items.info.pages
            return (items.viewModel(), moreMessagesAvailable)
        }
    }
}

//MARK: Mock

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
