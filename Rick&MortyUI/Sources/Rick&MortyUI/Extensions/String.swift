//
//  Created by Marc Hidalgo on 3/11/23.
//

import Foundation

public extension String {
    func formatDate() -> String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = isoFormatter.date(from: self) {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter.string(from: date)
        }
        
        return nil
    }
}
