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
    @Environment(AppState.self) private var appState
//    @Environment(\.openWindow) private var openWindow
//    @Environment(\.dismissWindow) private var dismissWindow
//
//    @FocusedValue(\.focusedBrowserState) private var state: BrowserState?

    var body: some View {
        Group {
            if let example = appState.currentExample {
                example.view
                    .environment(example)
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

struct ExampleHeader: View {
    let meta: ExampleMeta

    var body: some View {
        VStack(alignment: .leading) {
            let urlString = "https://github.com/drypot/BrowseSwiftCodeExamples/blob/main/" + meta.relativePath
            let url = URL(string: urlString)!
            Text(meta.title).font(.title)
            Link(destination: url) {
                Text(urlString)
            }
        }
        .padding()
        Divider()
    }
}
