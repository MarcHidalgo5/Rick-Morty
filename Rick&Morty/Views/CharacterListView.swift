//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI
import Rick_MortyKit
import Rick_MortyUI
import BSWInterfaceKit

#Preview {
    CharacterListView(dataSource: .mock)
}

struct CharacterListView: View, PlaceholderDataProvider {
    
    init(dataSource: CharacterDataSource) {
        _dataSource = StateObject(wrappedValue: dataSource)
    }
    
    @StateObject
    private var dataSource: CharacterDataSource
    
    var body: some View {
        List(dataSource.characters, id: \.id) { character in
            TextView(character: character)
        }
        .navigationTitle("Rick and Morty")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
    
    @MainActor 
    public static func generatePlaceholderData() -> CharacterDataSource {
        .mock
    }
}

private struct TextView: View {
    
    public init(character: CharacterViewModel) {
        self.character = character
    }
    
    private let character: CharacterViewModel
    
    var body: some View {
        NavigationLink {
            Text("Test")
        } label: {
            VStack(alignment: .center) {
                Text(character.name)
                    .lineLimit(1)
                    .font(.title2)
                    .padding(5)
                HStack {
                    Image(systemName: "pencil")
                        .frame(width: 100, height: 100)
                        .border(Color.red)
                    Text("Description kuhvbiluojiñ libhueojñrpwfkoe obibhujñerwfked iouhiejñrfowkd oiuhpijñegrfe iouhpijegrf oiuhpjiegkrf")
                        .font(.subheadline)
                }
            }
        }
    }
}


extension CharacterListView {
    struct Async: View {
        private let apiClient: RickAndMortyAPIClient
        
        public init(apiClient: RickAndMortyAPIClient) {
            self.apiClient = apiClient
        }
        
        public var body: some View {
            NavigationView {
                AsyncView.rickAndMortyView(
                    id: "professional-list") {
                        try await CharacterDataSource(apiClient: apiClient)
                    } hostedViewGenerator: {
                        CharacterListView(dataSource: $0)
                    }
            }
        }
    }
}
