//
//  BrowseSwiftCodeExamplesApp.swift
//  BrowseSwiftCodeExamples
//
//  Created by Kyuhyun Park on 6/14/26.
//

import SwiftUI

@main
struct BrowseSwiftCodeExamplesApp: App {
    //@NSApplicationDelegateAdaptor var appDelegate: AppDelegate

    @State private var appState = AppState()

    var body: some Scene {
        ExampleListWindow()
            .environment(appState)

        ExampleWindow()
            .environment(appState)
    }
}

// https://developer.apple.com/documentation/appkit/nsapplicationdelegate
// https://developer.apple.com/documentation/swiftui/nsapplicationdelegateadaptor

//class AppDelegate: NSObject, NSApplicationDelegate {
//    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
//        return true
//    }
//}
