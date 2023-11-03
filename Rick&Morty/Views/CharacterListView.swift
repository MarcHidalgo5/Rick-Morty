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
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            if dataSource.items.isEmpty {
                ProgressView()
                    .frame(height: 50)
            }
            List(dataSource.items, id: \.id) { character in
                CharacterView(for: character)
                    .onAppear() {
                        dataSource.loadMoreContentIfNeeded(currentItem: character)
                    }
            }
            .searchable(text: $searchText, prompt: "Search name")
            .onChange(of: searchText) { text in
                Task { @MainActor in
                    if text.isEmpty {
                        try await dataSource.resetAndFetchItems()
                    } else {
                        try await dataSource.resetAndSearchItems(text: searchText)
                    }
                }
            }
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
        
    }
    
    @ViewBuilder
    private var loadingView: some View {
        if dataSource.state == .loading {
            ProgressView()
                .frame(height: 50)
        }
    }
    
    @MainActor 
    public static func generatePlaceholderData() -> CharacterDataSource {
        .mock
    }
}

private struct CharacterView: View {
    
    public init(for character: CharacterViewModel) {
        self.character = character
    }
    
    private let character: CharacterViewModel
    
    var body: some View {
        NavigationLink {
            DetailCharacterView(for: character)
            } label: {
            VStack(alignment: .center, spacing: 15) {
                Text(character.name)
                    .lineLimit(1)
                    .font(.title3)
                    .textBold()
                HStack(spacing: 15) {
                    PhotoView(
                        photo: .init(url: character.imageURL, averageColor: .clear),
                        configuration: .init(placeholder: .init(shape: .rectangle, color: .blue.opacity(0.5)))
                    )
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("**Status:** \(character.status)")
                        Text("**Specie:** \(character.species)")
                        Text("**Gender:** \(character.gender)")
                    }
                    .font(.subheadline)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 5) {
                        Text("Episodes")
                        Text("\(character.episodes.count)")
                    }
                    .padding(.trailing, 5)
                    .font(.headline)
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
