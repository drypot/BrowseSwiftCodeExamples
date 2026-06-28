//
//  BrowseSwiftCodeExamplesApp.swift
//  BrowseSwiftCodeExamples
//
//  Created by Kyuhyun Park on 6/14/26.
//

import SwiftUI

@main
struct BrowseSwiftCodeExamplesApp: App {
    @State private var appState = ExampleAppState()

    var body: some Scene {
        ExampleListWindow()
            .environment(appState)

        ExampleWindow()
            .environment(appState)
    }
}
