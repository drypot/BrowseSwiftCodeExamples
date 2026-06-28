//
//  ExampleWindow.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/17/26.
//

import SwiftUI

struct ExampleWindow: Scene {
    var body: some Scene {
        Window("Example", id: "example") {
            ExampleView()
        }
    }
}

struct ExampleView: View {
    @Environment(ExampleAppState.self) private var appState

    var body: some View {
        Group {
            if let example = appState.selectedExample {
                example.makeView()
            } else {
                Text("...")
            }
        }
        .onAppear {
            appState.isExampleWindowOpened = true
        }
        .onDisappear {
            appState.isExampleWindowOpened = false
        }
    }
}
