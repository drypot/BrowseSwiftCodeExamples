//
//  ExampleListWindow.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/17/26.
//

import SwiftUI

struct ExampleListWindow: Scene {
    var body: some Scene {
        Window("Example List", id: "exampleList") {
            ExampleListView()
        }
    }
}

