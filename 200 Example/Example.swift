//
//  Example.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/28/26.
//

import SwiftUI
import Observation

enum ExampleCategory: Int {
    case hello
    case swift
    case swiftUI
    case combine
}

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

    static let table: [Example] = [
        Example(title: "Hello SwiftUI",
                relativePath: "SwiftUI/HelloSwiftUI.swift",
                category: .hello,
                makeView: { AnyView(HelloSwiftUI()) } ),
        Example(title: "SwiftUI, Text, Font",
                relativePath: "SwiftUI/Text/TextFontExample.swift",
                category: .swiftUI,
                makeView: { AnyView(TextFontExample()) } ),
        Example(title: "SwiftUI, Text, FontWeight",
                relativePath: "SwiftUI/Text/TextFontWeightExample.swift",
                category: .swiftUI,
                makeView: { AnyView(TextFontWeightExample()) } ),
        Example(title: "SwiftUI, Text, Style",
                relativePath: "SwiftUI/Text/TextStyleExample.swift",
                category: .swiftUI,
                makeView: { AnyView(TextStyleExample()) } ),
        Example(title: "SwiftUI, Text, NSColor",
                relativePath: "SwiftUI/Text/TextStyleNSColorExample.swift",
                category: .swiftUI,
                makeView: { AnyView(TextStyleNSColorExample()) } ),
        Example(title: "SwiftUI, Form",
                relativePath: "SwiftUI/Form/FormExample.swift",
                category: .swiftUI,
                makeView: { AnyView(FormExample()) } ),
        Example(title: "SwiftUI, OnChange",
                relativePath: "SwiftUI/Form/OnChangeExample.swift",
                category: .swiftUI,
                makeView: { AnyView(OnChangeExample()) } ),
        Example(title: "SwiftUI, NavigationSplitView",
                relativePath: "SwiftUI/Navigation/NavigationSplitViewExample.swift",
                category: .swiftUI,
                makeView: { AnyView(NavigationSplitViewExample()) } ),
        Example(title: "SwiftUI, Tree",
                relativePath: "SwiftUI/Tree/TreeExample.swift",
                category: .swiftUI,
                makeView: { AnyView(TreeExample()) } ),
        Example(title: "SwiftUI, ID",
                relativePath: "SwiftUI/ID/IDExample.swift",
                category: .swiftUI,
                makeView: { AnyView(IDExample()) } ),
    ]
}
