//
//  ExampleAppState.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/16/26.
//

import SwiftUI
import Observation

@Observable
class ExampleAppState {
    var selectedExampleID: Example.ID? {
        didSet {
            UserDefaults.standard.set(selectedExampleID, forKey: "selectedExampleID")
        }
    }

    var selectedExample: Example?

    var isExampleWindowOpened = false

    init() {
        selectedExampleID = UserDefaults.standard.string(forKey: "selectedExampleID")
    }

    func updateSelectedExample() {
        if let selectedExampleID {
            selectedExample = Example.table.first { $0.id ==  selectedExampleID }
        } else {
            selectedExample = nil
        }
    }
}
