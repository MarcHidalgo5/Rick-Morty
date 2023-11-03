//
//  Created by Marc Hidalgo on 3/11/23.
//

import SwiftUI
import Rick_MortyKit

#Preview {
    StartView(apiClient: MockRickAndMortyAPIClient())
}

struct StartView: View {
    
    private let apiClient: RickAndMortyAPIClient
    
    public init(apiClient: RickAndMortyAPIClient) {
        self.apiClient = apiClient
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                
                NavigationLink {
                    CharacterListView.Async(apiClient: apiClient)
                } label: {
                    Text("Get started")
                        .bold()
                        .foregroundStyle(.primary)
                }
                .padding()
                .buttonStyle(.plain)
                .background(Color.blue.opacity(0.8))
                .cornerRadius(12)
            }
        }
        
    }
}


