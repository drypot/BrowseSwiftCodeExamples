//
//  BrowseSwiftCodeExamplesApp.swift
//  BrowseSwiftCodeExamples
//
//  Created by Kyuhyun Park on 6/14/26.
//

import SwiftUI

@main
struct BrowseSwiftCodeExamplesApp: App {
    @State private var appState = AppState()

    var body: some Scene {
        ExampleListWindow()
            .environment(appState)

        ExampleWindow()
            .environment(appState)
    }
}
