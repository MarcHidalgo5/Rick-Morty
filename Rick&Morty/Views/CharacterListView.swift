//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI
import Rick_MortyKit
import Rick_MortyUI
import BSWInterfaceKit

#Preview {
    NavigationView {
        CharacterListView(dataSource: .mock)
    }
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
        .navigationTitle("Characters")
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
                HStack(spacing: 15) {
                    PhotoView(
                        photo: .init(url: character.imageURL, averageColor: .clear),
                        configuration: .init(placeholder: .init(shape: .rectangle, color: .red.opacity(0.5)))
                    )
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Status: \(character.status)")
                            .font(.subheadline)
                        Text("Specie: \(character.species)")
                            .font(.subheadline)
                        Text("Gender: \(character.gender)")
                            .font(.subheadline)
                    }
                    .padding(2)
                    VStack {
                        Text("Episodes")
                            .padding(.bottom, 5)
                            .font(.headline)
                        Text("\(character.episodes.count)")
                            .font(.headline)
                    }
                    .padding([.top, .bottom, .leading], 2)
                    .padding(.trailing, 10)
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
