//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI

public extension SwiftUI.View {
    @ViewBuilder
    func textBold() -> some View {
        if #available(iOS 16.0, *) {
            self.bold()
        } else {
            self
        }
    }
}
