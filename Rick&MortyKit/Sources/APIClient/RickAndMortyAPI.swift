//
//  Created by Marc Hidalgo on 2/11/23.
//

import BSWFoundation
import Foundation

public enum RickAndMortyAPI {
    
    public enum Environment: BSWFoundation.Environment {
        case production
        
        public var baseURL: URL {
            switch self {
            case .production:
                return URL(string: "https://rickandmortyapi.com/api")!
            }
        }
    }
}
