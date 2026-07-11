//
//  OnChangeExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/7/26.
//

import SwiftUI

@Observable
fileprivate final class AppState {
    var value: Int = 0
    var value2: Int = 0
}

struct OnChangeExample: View {
    @State private var state = AppState()

    var body: some View {
        Form {
            ContentView()
            Button("Change Value") {
                state.value = Int.random(in: 1...100)
            }
            Button("Change Value 2") {
                state.value2 = Int.random(in: 1...100)
            }
        }
        .onAppear {
            print("on appear:")
            state.value = 20
        }
        .onChange(of: { print("on change 10"); return 10 }() ) {
        }
        .onChange(of: state.value) { oldValue, newValue in
            print("on change 20: old = \(oldValue), new = \(newValue), value = \(state.value)")
        }
        .modifier(MyModifier(state: state))
    }
}

fileprivate struct MyModifier: ViewModifier {
    var state: AppState

    func body(content: Content) -> some View {
        content
            .onChange(of: { print("on change 30"); return 10 }() ) {
            }
            .onChange(of: state.value2) { oldValue, newValue in
                print("on change 40: old = \(oldValue), new = \(newValue), value2 = \(state.value2)")
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
