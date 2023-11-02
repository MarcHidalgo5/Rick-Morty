//
//  Created by Marc Hidalgo on 2/11/23.
//

import BSWFoundation

enum CharacterAPI: Endpoint {
    case fetchCharacter(page: Int)
    
    var path: String {
        switch self {
        case .fetchCharacter(let page):
            return "/character/?page=\(page)"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchCharacter:
            return nil
        }
    }
}
