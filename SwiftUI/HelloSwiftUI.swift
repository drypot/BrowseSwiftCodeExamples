//
//  HelloSwiftUI.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/16/26.
//

import SwiftUI

struct HelloSwiftUI: View {
    @Environment(AppState.self) private var appState
    @Environment(ExampleMeta.self) private var exampleMeta

    var body: some View {
        VStack(alignment: .leading) {
            exampleHeader
            exampleBody
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    var exampleHeader: some View {
        ExampleHeader(meta: exampleMeta)
    }

    @ViewBuilder
    var exampleBody: some View {
        Text("Hello, SwiftUI!")
    }
}
