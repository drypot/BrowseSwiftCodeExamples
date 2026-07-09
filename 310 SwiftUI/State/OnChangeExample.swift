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
            print("value: \(newValue)")
        }
    }
}

#Preview {
    OnChangeExample()
}
