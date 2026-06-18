//
//  ExampleListView.swift
//  BrowseSwiftCodeExamples
//
//  Created by Kyuhyun Park on 6/14/26.
//

import SwiftUI

struct ExampleListView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.openWindow) private var openWindow

    @AppStorage("selectedExampleID") var selectedExampleID: Example.ID?

    @State private var searchText = ""

    private var filteredItems: [Example] {
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
        if !appState.isShowExampleWindow {
            openWindow(id: "example")
        }
    }
}

#Preview {
    ExampleListView()
}
