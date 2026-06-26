//
//  NavigationSplitViewExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/26/26.
//

import SwiftUI

struct NavigationSplitViewExample: View {

    // Part

    struct Part: Identifiable, Hashable {
        let name: String

        var id: String {
            return name
        }
    }

    static let partTable = [
        Part(name: "Part 1"),
        Part(name: "Part 2"),
        Part(name: "Part 3"),
        Part(name: "Part 4"),
        Part(name: "Part 5"),
        Part(name: "Part 6"),
    ]

    static let partDic = Dictionary(uniqueKeysWithValues: partTable.map { ($0.id, $0) })

    // Product

    struct Product: Identifiable, Hashable {
        let name: String

        var id: String {
            return name
        }

        let parts: [Part]

        init(name: String, partIDs: [Part.ID]) {
            self.name = name
            self.parts = partIDs.compactMap { partDic[$0]! }
        }
    }

    static let productTable = [
        Product(name: "Product 1", partIDs: ["Part 1", "Part 2", "Part 3"]),
        Product(name: "Product 2", partIDs: ["Part 4", "Part 5", "Part 6"]),
        Product(name: "Product 3", partIDs: ["Part 1", "Part 2", "Part 6"]),
    ]

    static let productDic = Dictionary(uniqueKeysWithValues: productTable.map { ($0.id, $0) })

    // State

    @State var selectedProductID: Product.ID?
    @State var selectedPartID: Part.ID?
//    @State var path = NavigationPath()

    var body: some View {

        NavigationSplitView {
            List(Self.productTable, selection: $selectedProductID) { product in
                NavigationLink(product.name, value: product.id)
            }
            .contextMenu(forSelectionType: Product.ID.self) { selection in
                ForEach(selection.sorted(), id:\.self) { productID in
                    Button("Action on \(productID)") {
                        print("action on: \(productID)")
                    }
                }
            }
            .onChange(of: selectedProductID) {
                selectedPartID = nil
            }
        } content: {
            if let selectedProductID, let product = Self.productDic[selectedProductID] {
                List(product.parts, selection: $selectedPartID) { part in
                    NavigationLink(part.name, value: part.id)

//                    Button(part.name) {
//                        path.append(part.id)
//                    }
//                    .buttonStyle(.plain)
                }
                .contextMenu(forSelectionType: Part.ID.self) { selection in
                    ForEach(selection.sorted(), id:\.self) { partID in
                        Button("Action on \(partID)") {
                            print("action on: \(partID)")
                        }
                    }
                }
            }
        } detail: {
            if let selectedPartID, let part = Self.partDic[selectedPartID] {
                Text("\(part.name) detail")
            } else {
                Text("...")
            }

//            NavigationStack(path: $path) {
//                Text("...")
//                    .navigationDestination(for: Part.ID.self) { partID in
//                        if let part = Self.partDic[partID] {
//                            Text("\(part.name) detail")
//                        }
//                    }
//            }

        }
        .navigationTitle("NavigationSplitView Demo")
    }
}

#Preview {
    NavigationSplitViewExample()
}
