 //
//  Created by Marc Hidalgo on 2/11/23.
//

import SwiftUI
import BSWInterfaceKit

public extension AsyncView where HostedView: PlaceholderDataProvider, LoadingView == AsyncStatePlainLoadingView<HostedView>, HostedView.Data == Data, ErrorView == RickAndMortyErrorView {
    static func rickAndMortyView(
        id: ID,
        dataGenerator: @escaping DataGenerator,
        hostedViewGenerator: @escaping HostedViewGenerator) -> some View {
            return AsyncView(
                id: id,
                dataGenerator: dataGenerator,
                hostedViewGenerator: hostedViewGenerator,
                errorViewGenerator: {
                    RickAndMortyErrorView(error: $0, onRetry: $1)
                }
            )
        }
}
