//
//  AppState.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/16/26.
//

import SwiftUI
import Observation

enum ExampleCategory: Int {
    case swift = 1
    case swiftUI = 2
    case combine = 3
}

@Observable
final class ExampleMeta: Identifiable {
    let title: String
    let relativePath: String
    let category: ExampleCategory
    let view: AnyView

    var id: String {
        title
    }

    init(title: String, relativePath: String, category: ExampleCategory, view: AnyView) {
        self.title = title
        self.relativePath = relativePath
        self.category = category
        self.view = view
    }
}

@Observable
class AppState {
    let examples: [ExampleMeta] = [
        ExampleMeta(title: "Hello SwiftUI",
                relativePath: "SwiftUI/HelloSwiftUI.swift",
                category: .swiftUI,
                view: AnyView(HelloSwiftUI()))
    ]

    var currentExample: ExampleMeta?

    var isExampleWindowOpened = false

    func updateCurrentExample(withID id: ExampleMeta.ID?) {
        guard let id else {
            currentExample = nil
            return
        }
        currentExample = examples.first { $0.id ==  id }
    }
}
