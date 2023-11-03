//
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI

public struct RickAndMortyErrorView: View {
    
    private enum Constants {
        static let NormalSpacing: CGFloat = 8
        static let Spacing: CGFloat = 16
    }
    
    private let error: Swift.Error
    private let onRetry: () -> ()
    
    public init(error: Error, onRetry: @escaping () -> Void) {
        self.error = error
        self.onRetry = onRetry
    }
    
    public var body: some View {
        VStack(spacing: Constants.Spacing) {
            Text("Error")
                .font(.headline)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            
            Text(error.localizedDescription)
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
            
            Button(action: {
                self.onRetry()
            }, label: {
                Label {
                    Text("Retry")
                        .font(.title3)
                } icon: {
                    Image(systemName: "arrow.counterclockwise")
                }
                .padding(.init(top: Constants.NormalSpacing, leading: Constants.Spacing, bottom: Constants.NormalSpacing, trailing: Constants.Spacing))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(12)
            })
        }
        .padding()
    }
}
