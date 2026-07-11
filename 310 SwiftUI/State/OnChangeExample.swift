//
//  OnChangeExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/7/26.
//

import SwiftUI

struct OnChangeExample: View {
    @State private var value: Int = 10
    @State private var value2: Int = 10

    var body: some View {
        Form {
            ContentView()
            
            Button("Change Value") {
                value = Int.random(in: 1...100)
            }
            Button("Change Value 2") {
                value2 = Int.random(in: 1...100)
            }
        }
        .onAppear {
            print("on appear:")
            value = 20
        }
        .onChange(of: { print("on change 10"); return 10 }() ) {
        }
        .onChange(of: value) { oldValue, newValue in
            print("on change 20: old = \(oldValue), new = \(newValue), value = \(value)")
        }
        .modifier(MyModifier(value2: value2))
    }
}

fileprivate struct MyModifier: ViewModifier {
    var value2: Int

    func body(content: Content) -> some View {
        content
            .onChange(of: { print("on change 30"); return 10 }() ) {
            }
            .onChange(of: value2) { oldValue, newValue in
                print("on change 40: old = \(oldValue), new = \(newValue), value2 = \(value2)")
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
