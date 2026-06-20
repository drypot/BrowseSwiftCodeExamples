//
//  AppState.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/16/26.
//

import SwiftUI
import Observation

enum ExampleCategory: Int {
    case hello
    case swift
    case swiftUI
    case combine
}

@Observable
final class Example: Identifiable {
    let title: String
    let relativePath: String
    let category: ExampleCategory
    let makeView: () -> AnyView

    var id: String {
        title
    }

    init(title: String, relativePath: String, category: ExampleCategory, makeView: @escaping () -> AnyView) {
        self.title = title
        self.relativePath = relativePath
        self.category = category
        self.makeView = makeView
    }
}

@Observable
class AppState {
    let examples: [Example] = [
        Example(title: "Hello SwiftUI", relativePath: "SwiftUI/HelloSwiftUI.swift", category: .hello, makeView: { AnyView(HelloSwiftUI()) }),
        Example(title: "SwiftUI, Text, Font", relativePath: "SwiftUI/TextFontExample.swift", category: .swiftUI, makeView: { AnyView(TextFontExample()) }),
        Example(title: "SwiftUI, Text, FontWeight", relativePath: "SwiftUI/TextFontWeightExample.swift", category: .swiftUI, makeView: { AnyView(TextFontWeightExample()) }),
    ]

    var selectedExampleID: Example.ID? {
        didSet {
            UserDefaults.standard.set(selectedExampleID, forKey: "selectedExampleID")
        }
    }

    var selectedExample: Example?

    var isExampleWindowOpened = false

    init() {
        selectedExampleID = UserDefaults.standard.string(forKey: "selectedExampleID")
    }

    func updateSelectedExample() {
        if let selectedExampleID {
            selectedExample = examples.first { $0.id ==  selectedExampleID }
        } else {
            selectedExample = nil
        }
    }
}
