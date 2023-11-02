//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation
import Rick_MortyKit

public class CharacterViewModel: ObservableObject, Identifiable {
    public init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: CharacterResponse.Character.Location, location: CharacterResponse.Character.Location, imageURL: URL?, episodes: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.imageURL = imageURL
        self.episodes = episodes
        self.url = url
        self.created = created
    }
    
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: CharacterResponse.Character.Location
    public let location: CharacterResponse.Character.Location
    public let imageURL: URL?
    public let episodes: [String]
    public let url: String
    public let created: String
}

extension CharacterViewModel {
    
    static let mockCharacter1 = CharacterViewModel(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: .init(name: "Earth", url: ""),
        location: .init(name: "Earth", url: ""),
        imageURL: nil,
        episodes: ["https://rickandmortyapi.com/api/episode/1"],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    )
    
    static let mockCharacter2 = CharacterViewModel(
        id: 2,
        name: "Morty Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: .init(name: "Earth", url: ""),
        location: .init(name: "Earth", url: ""),
        imageURL: nil,
        episodes: ["https://rickandmortyapi.com/api/episode/1"],
        url: "https://rickandmortyapi.com/api/character/2",
        created: "2017-11-04T18:50:21.651Z"
    )
    
    static let mockCharacter3 = CharacterViewModel(
        id: 3,
        name: "Summer Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Female",
        origin: .init(name: "Earth", url: ""),
        location: .init(name: "Earth", url: ""),
        imageURL: nil,
        episodes: ["https://rickandmortyapi.com/api/episode/6"],
        url: "https://rickandmortyapi.com/api/character/3",
        created: "2017-11-04T19:09:56.428Z"
    )
    
    static let mockCharacter4 = CharacterViewModel(
        id: 4,
        name: "Beth Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Female",
        origin: .init(name: "Earth", url: ""),
        location: .init(name: "Earth", url: ""),
        imageURL: nil,
        episodes: ["https://rickandmortyapi.com/api/episode/6"],
        url: "https://rickandmortyapi.com/api/character/4",
        created: "2017-11-04T19:22:43.665Z"
    )
    
    static let mockCharacter5 = CharacterViewModel(
        id: 5,
        name: "Jerry Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: .init(name: "Earth", url: ""),
        location: .init(name: "Earth", url: ""),
        imageURL: nil,
        episodes: ["https://rickandmortyapi.com/api/episode/6"],
        url: "https://rickandmortyapi.com/api/character/5",
        created: "2017-11-04T19:26:56.301Z"
    )
    
    static let mockCharacter6 = CharacterViewModel(
        id: 6,
        name: "Abadango Cluster Princess",
        status: "Alive",
        species: "Alien",
        type: "",
        gender: "Female",
        origin: .init(name: "Abadango", url: ""),
        location: .init(name: "Abadango", url: ""),
        imageURL: nil,
        episodes: ["https://rickandmortyapi.com/api/episode/27"],
        url: "https://rickandmortyapi.com/api/character/6",
        created: "2017-11-04T19:50:28.250Z"
    )
}
