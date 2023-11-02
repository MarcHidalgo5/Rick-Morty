//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation

public class CharacterViewModel: ObservableObject, Identifiable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension CharacterViewModel {
    static let mockCharacter1 = CharacterViewModel(
        id: 1,
        name: "Test"
    )
    
    static let mockCharacter2 = CharacterViewModel(
        id: 2,
        name: "Test2"
    )
    
    static let mockCharacter3 = CharacterViewModel(
        id: 3,
        name: "Test3"
    )
    
    static let mockCharacter4 = CharacterViewModel(
        id: 4,
        name: "Test4"
    )
    
    static let mockCharacter5 = CharacterViewModel(
        id: 5,
        name: "Test5"
    )
    
    static let mockCharacter6 = CharacterViewModel(
        id: 6,
        name: "Test6"
    )
}
