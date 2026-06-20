//
//  HelloSwiftUI.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/16/26.
//

import SwiftUI

struct HelloSwiftUI: View {
    @Environment(Example.self) private var example

    var body: some View {
        VStack(alignment: .leading) {
            exampleHeader
            exampleBody
        }
    }

    var exampleHeader: some View {
        ExampleHeader(example: example)
    }

    var exampleBody: some View {
        Text("Hello, SwiftUI!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
