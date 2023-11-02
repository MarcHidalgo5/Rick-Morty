//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI
import BSWInterfaceKit

#Preview {
    DetailCharacterView(for: .mockCharacter1)
}

struct DetailCharacterView: View {
    
    init(for character: CharacterViewModel) {
        self.character = character
    }
    
    private let character: CharacterViewModel
    
    @Environment(\.dismiss)
    private var dismiss
    
    var body: some View {
        ScrollView {
            PhotoView(
                photo: .init(url: character.imageURL, averageColor: .clear),
                configuration: .init(placeholder: .init(shape: .rectangle, color: .blue.opacity(0.5)))
            )
            Text(character.gender)
            Text(character.status)
            Text(character.species)
            Text(character.created)
            Text(character.type)
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
