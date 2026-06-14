//
//  ExampleListView.swift
//  BrowseSwiftCodeExamples
//
//  Created by Kyuhyun Park on 6/14/26.
//

import SwiftUI

struct ExampleListView: View {
    let names = [
        "Swift Programming Language",
        "SwiftUI Custom View",
        "UIKit View Programming",
        "Advanced Swift Concurrency",
        "Swift Data Persistence"
    ]

    var body: some View {
        SearchableListView(items: names)
    }
}

struct SearchableListView: View {
    let items: [String]

    @State private var searchText = ""

    private var filteredItems: [String] {
        let words = searchText.split(separator: " ").map { String($0).lowercased() }
        guard !words.isEmpty else { return items }

        return items.filter { item in
            let lowercased = item.lowercased()
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

            List(filteredItems, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ExampleListView()
}
