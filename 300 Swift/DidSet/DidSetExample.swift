//
//  DidSetExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 7/10/26.
//

import SwiftUI
import Observation

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
                state.selectedID = random()
                dump()
            }
            Button("2") {
                state.selectedIDs = [random()]
                dump()
            }
            Button("3") {
                state.selectedIDs = [random()]
                state.selectedIDs.insert(random())
                state.selectedIDs.insert(random())
                dump()
            }
            Button("5") {
                state.selectedID = nil
                dump()
            }
            Button("6") {
                state.selectedIDs = []
                dump()
            }
        }
        .onChange(of: state.selectedID) { oldValue, newValue in
            print("changed: selectedID, \(oldValue?.description ?? "nil"), \(newValue?.description ?? "nil")")
        }
        .onChange(of: state.selectedIDs) { oldValue, newValue in
            print("changed: selectedIDs, \(oldValue), \(newValue)")
        }
    }

    func random() -> Int {
        Int.random(in: 0..<1000)
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
