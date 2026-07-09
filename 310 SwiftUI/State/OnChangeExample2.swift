//
//  OnChangeExample2.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/7/26.
//

import SwiftUI

@Observable
fileprivate final class AppState {
    var count1 = 100
    var count2 = 200
}

struct OnChangeExample2: View {
    @State private var state = AppState()

    var body: some View {
        Form {
            Button("Set 10, 20") {
                state.count1 = 10
                state.count2 = 20
            }
            Button("Set 100, -") {
                state.count1 = 100
            }
            Button("Set 1000, 2000") {
                state.count1 = 1000
                state.count2 = 2000
            }
        }
        .onChange(of: state.count1) { _, newValue in
            print("count1: \(state.count1)")
        }
        .onChange(of: state.count2) { _, newValue in
            print("count2: \(state.count2)")
        }
    }
}

#Preview {
    OnChangeExample()
}
