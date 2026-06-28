//
//  ExampleListWindow.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/17/26.
//

import SwiftUI

struct ExampleListWindow: Scene {
    var body: some Scene {
        Window("Examples", id: "examples") {
            ExampleListView()
        }
    }
}

struct ExampleListView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.openWindow) private var openWindow

    @State private var searchText = ""

    private var filteredItems: [Example] {
        let words = searchText.split(separator: " ").map { String($0).lowercased() }
        guard !words.isEmpty else { return Example.table }

        return Example.table.filter { example in
            let lowercased = example.title.lowercased()
            return words.allSatisfy { word in lowercased.contains(word) }
        }
    }

    var body: some View {
        NavigationSplitView {
            listBody
                .frame(minWidth: 220)
        } detail: {
            detailBody
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .searchable(text: $searchText)
        .task {
            updateExampleView()
        }
        .onDisappear {
            terminate()
        }
    }

    @ViewBuilder
    var listBody: some View {
        @Bindable var appState = appState
        List(filteredItems, selection: $appState.selectedExampleID) { example in
            Text(example.title)
        }
        .onChange(of: appState.selectedExampleID, updateExampleView)
    }

    var detailBody: some View {
        VStack(alignment: .leading) {
            if let example = appState.selectedExample {
                let urlString = "https://github.com/drypot/BrowseSwiftCodeExamples/blob/main/" + example.relativePath
                let url = URL(string: urlString)!
                Text(example.title).font(.title)
                Link(destination: url) {
                    Text("Open GitHub source code")
                }
            } else {
                Text("...")
            }
        }
        .padding()
    }

    func updateExampleView() {
        appState.updateSelectedExample()
        if !appState.isExampleWindowOpened {
            openWindow(id: "example")
        }
    }

    func terminate() {
        NSApplication.shared.terminate(nil)
    }
}
