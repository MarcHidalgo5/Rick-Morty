//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI
import BSWInterfaceKit

#Preview {
    NavigationView {
        DetailCharacterView(for: .mockCharacter1)
    }
}

struct DetailCharacterView: View {
    
    init(for character: CharacterViewModel) {
        self.character = character
    }
    
    private let character: CharacterViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                PhotoView(
                    photo: .init(url: character.imageURL, averageColor: .clear),
                    configuration: .init(placeholder: .init(shape: .rectangle, color: .blue.opacity(0.5)))
                )
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
                .shadow(radius: 5)

                Group {
                    InfoRow(label: "Status", value: character.status)
                    InfoRow(label: "Species", value: character.species)
                    InfoRow(label: "Gender", value: character.gender)
                    if !character.type.isEmpty {
                        InfoRow(label: "Type", value: character.type)
                    }
                    InfoRow(label: "Origin", value: character.origin.name)
                    InfoRow(label: "Location", value: character.location.name)
                    InfoRow(label: "Created", value: character.created.formatDate() ?? "Unknown Date")
                }
                .padding(.horizontal)

                Text("Episode appearances: \(character.episodes.count)")
                    .font(.headline)
                    .padding(.top, 5)

                Spacer() 
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func InfoRow(label: String, value: String) -> some View {
        HStack {
            Text("\(label):")
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline)
        }
    }
}
