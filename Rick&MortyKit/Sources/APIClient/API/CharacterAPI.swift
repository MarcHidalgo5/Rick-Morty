//
//  Created by Marc Hidalgo on 2/11/23.
//

import BSWFoundation

enum CharacterAPI: Endpoint {
    case fetchCharacter(page: Int)
    case searchCharacter(page: Int, text: String)
    
    var path: String {
        switch self {
        case .fetchCharacter(let page):
            return "/character/?page=\(page)"
        case .searchCharacter(let page, let text):
            return "/character/?page=\(page)&name=\(text)"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchCharacter, .searchCharacter:
            return nil
        }
    }
}
