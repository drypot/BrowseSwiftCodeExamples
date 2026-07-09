//
//  DidSetExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/10/26.
//

import SwiftUI

@Observable
fileprivate final class AppState {
    private var _selectedID: Int?

    var selectedIDs: Set<Int> = [] {
        didSet {
            if  selectedIDs.count == 0 {
                _selectedID = nil
            } else if selectedIDs.count == 1 {
                _selectedID = selectedIDs.first
            }
        }
    }

    var selectedID: Int? {
        get {
            _selectedID
        }

        set {
            if let newValue {
                selectedIDs = [newValue]
            } else {
                selectedIDs = []
            }
        }
    }
}

struct DidSetExample: View {
    @State private var state = AppState()

    var body: some View {
        Form {
            Button("1") {
                state.selectedID = 1
                dump()
            }
            Button("2") {
                state.selectedIDs = [10]
                dump()
            }
            Button("3") {
                state.selectedIDs = [100, 200, 300]
                dump()
            }
            Button("4") {
                state.selectedID = nil
                dump()
            }
            Button("5") {
                state.selectedIDs = []
                dump()
            }
        }
    }

    func dump() {
        print("---")
        print("selectedID: \(state.selectedID?.description ?? "nil")")
        print("selectedIDs: \(state.selectedIDs)")
    }
}

#Preview {
    DidSetExample()
}
