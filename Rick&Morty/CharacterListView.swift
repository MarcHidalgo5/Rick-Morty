//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI

#Preview {
    CharacterListView()
}

struct CharacterListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                TextView()
                TextView()
                TextView()
            }
            .border(Color.red)
        }
    }
}

private struct TextView: View {
    
    var body: some View {
        Text("Test")
    }
}


extension CharacterListView {
    
}
