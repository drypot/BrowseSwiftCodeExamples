//
//  FormExample2.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/14/26.
//

import SwiftUI

fileprivate enum AppViewMode: String, CaseIterable, Identifiable {
    case list
    case grid
    case gallery

    var id: String {
        self.rawValue
    }

    var imageName: String {
        switch self {
        case .list: return "list.bullet"
        case .grid: return "square.grid.2x2"
        case .gallery: return "photo.on.rectangle"
        }
    }
}

@Observable
fileprivate class AppState {
}

struct FormExample2: View {
    @State private var selectedMode: AppViewMode = .list

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Picker("View Mode", selection: $selectedMode) {
                Text("List").tag(AppViewMode.list)
                Text("Grid").tag(AppViewMode.grid)
                Text("Gallery").tag(AppViewMode.gallery)
//                ForEach(AppViewMode.allCases) { mode in
//                    Image(systemName: mode.imageName)
//                        .padding(.horizontal, 20)
//                        .tag(mode)
//                }
            }
            .pickerStyle(.segmented)
            .frame(width: 250)
            .controlSize(.large)
            .labelsHidden()

            Text("\(selectedMode.rawValue.capitalized)")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

