//
//  ExampleWindow.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/17/26.
//

import SwiftUI

struct ExampleWindow: Scene {
    @Environment(AppState.self) private var appState
//    @Environment(\.openWindow) private var openWindow
//    @Environment(\.dismissWindow) private var dismissWindow
//
//    @FocusedValue(\.focusedBrowserState) private var state: BrowserState?

    var body: some Scene {
        Window("Example", id: "example") {
            Group {
                if let example = appState.selectedExample {
                    example.view
                        .environment(example)
                } else {
                    Spacer()
                }
            }
            .onAppear {
                appState.isShowExampleWindow = true
            }
            .onDisappear {
                appState.isShowExampleWindow = false
            }
        }
    }
}
