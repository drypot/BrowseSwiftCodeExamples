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
        Example(title: "Hello SwiftUI", relativePath: "SwiftUI/HelloSwiftUI.swift", category: .swiftUI, makeView: { AnyView(HelloSwiftUI()) })
    ]

    var currentExample: Example?
    var isExampleWindowOpened = false

    func updateCurrentExample(withID id: Example.ID?) {
        guard let id else {
            currentExample = nil
            return
        }
        currentExample = examples.first { $0.id ==  id }
    }
}
