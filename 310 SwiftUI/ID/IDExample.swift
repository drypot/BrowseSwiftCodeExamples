//
//  IDExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/10/26.
//

import SwiftUI

struct IDExample: View {
    @State private var refreshCount: Int = 10

    var body: some View {
        VStack(alignment: .leading) {
            Color.blue
                .frame(width: 100, height: 100)
                .task {
                    print("task: \(refreshCount)")
                }
                // id 가 변경될 때마다 task 를 실행하려면
                // id 와 task 의 위치가 중요하다.
                // id 가 밖에 있어야 한다.
                .id(refreshCount)

            Color.cyan
                .frame(width: 100, height: 100)
                .onChange(of: refreshCount) {
                    print("change: \(refreshCount)")
                }

            Button("Set to 30") {
                refreshCount = 30
            }
            Button("Set to 40") {
                refreshCount = 40
            }
            Button("Set to 50") {
                refreshCount = 50
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

