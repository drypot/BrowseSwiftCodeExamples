//
//  ExampleListWindow.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/17/26.
//

import SwiftUI

struct ExampleListWindow: Scene {
    var body: some Scene {
        Window("Example List", id: "exampleList") {
            ExampleListView()
        }
    }
}

struct ExampleListView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.openWindow) private var openWindow

    @AppStorage("selectedExampleID") var selectedExampleID: ExampleMeta.ID?

    @State private var searchText = ""

    private var filteredItems: [ExampleMeta] {
        let words = searchText.split(separator: " ").map { String($0).lowercased() }
        guard !words.isEmpty else { return appState.examples }

        return appState.examples.filter { example in
            let lowercased = example.title.lowercased()
            return words.allSatisfy { word in
                lowercased.contains(word)
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                    .textFieldStyle(.plain)
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.4))
            }
            .padding()

            List(filteredItems, selection: $selectedExampleID) { example in
                Text(example.title)
            }
            .onChange(of: selectedExampleID) {
                updateExample()
            }
            .task {
                updateExample()
            }
        }
    }

    func updateExample() {
        appState.updateCurrentExample(withID: selectedExampleID)
        if !appState.isExampleWindowOpened {
            openWindow(id: "example")
        }
    }
}

