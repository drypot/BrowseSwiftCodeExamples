//
//  HelloSwiftUI.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/16/26.
//

import SwiftUI

struct HelloSwiftUI: View {
    @Environment(AppState.self) private var appState
    @Environment(Example.self) private var example

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HelloSwiftUI()
}
