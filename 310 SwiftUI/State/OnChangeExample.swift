//
//  OnChangeExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/7/26.
//

import SwiftUI

struct OnChangeExample: View {
    @State private var value: Int = 10

    var body: some View {
        Form {
            ContentView()
            
            Button("Set 30") {
                value = 30
            }
            Button("Set 40") {
                value = 40
            }
            Button("Set 50") {
                value = 50
            }
        }
        .onChange(of: value, initial: true) { _, newValue in
            print("on change value: \(newValue)")
        }
    }
}

fileprivate struct ContentView: View {
    var body: some View {
        TmpView(name: "tmp view1")
        TmpView(name: "tmp view2")
    }
}

fileprivate struct TmpView: View {
    var name: String

    init(name: String) {
        self.name = name
        print("\(name) init:")
    }
    var body: some View {
        let _ = print("\(name) body:")
        Text(name)
    }
}

#Preview {
    OnChangeExample()
}
