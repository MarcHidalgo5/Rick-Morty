//
//  Created by Marc Hidalgo on 2/11/23.
//

import Foundation

public struct CharacterResponse: Codable {
    public let info: Info
    public let results: [Character]
    
    public struct Info: Codable {
        public let count: Int
        public let pages: Int
        public let next: String?
        public let prev: String?
    }
    
    public struct Character: Codable, Identifiable {
        public let id: Int
        public let name: String
        public let status: String
        public let species: String
        public let type: String
        public let gender: String
        public let origin: Location
        public let location: Location
        public let image: String
        public let episode: [String]
        public let url: String
        public let created: String
        
        public struct Location: Codable {
            public let name: String
            public let url: String
        }
    }
}

//MARK: Mock
extension CharacterResponse {
    static var mock: CharacterResponse {
        return CharacterResponse(
            info: Info(
                count: 1,
                pages: 1,
                next: nil,
                prev: nil
            ),
            results: [
                Character(
                    id: 1,
                    name: "Rick Sanchez",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: Character.Location(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: Character.Location(
                        name: "Earth (Replacement Dimension)",
                        url: "https://rickandmortyapi.com/api/location/20"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2"
                    ],
                    url: "https://rickandmortyapi.com/api/character/1",
                    created: "2017-11-04T18:48:46.250Z"
                )
            ]
        )
    }
}










