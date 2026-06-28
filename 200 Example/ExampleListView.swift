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

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            searchFieldBody
            listBody
        }
        .task {
            updateExampleView()
        }
        .onDisappear {
            terminate()
        }
    }

    var searchFieldBody: some View {
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
    }

    private var filteredItems: [Example] {
        let words = searchText.split(separator: " ").map { String($0).lowercased() }
        guard !words.isEmpty else { return Example.table }

        return Example.table.filter { example in
            let lowercased = example.title.lowercased()
            return words.allSatisfy { word in lowercased.contains(word) }
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

