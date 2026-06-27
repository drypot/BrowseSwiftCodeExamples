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
    @State var isInspectorPresented = false
    @State var searchText = ""

    var body: some View {
        NavigationSplitView {
            productListView
                .searchable(text: $searchText)
        } content: {
            partListView
        } detail: {
            detailView
        }
        .navigationTitle("Demo App")
        .inspector(isPresented: $isInspectorPresented) {
            Text("Inspector")
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .task {
            initView()
        }
    }

    var productListView: some View {
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
        .toolbar {
            ToolbarItem {
                Button("more", systemImage: "ellipsis") {
                }
                .help("More")
            }
        }
    }

    @ViewBuilder
    var partListView: some View {
        if let selectedProductID, let product = Self.productDic[selectedProductID] {
            List(product.parts, selection: $selectedPartID) { part in
                NavigationLink(part.name, value: part.id)
            }
            .contextMenu(forSelectionType: Part.ID.self) { selection in
                ForEach(selection.sorted(), id:\.self) { partID in
                    Button("Action on \(partID)") {
                        print("action on: \(partID)")
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("more", systemImage: "ellipsis") {
                    }
                    .help("More")
                }
            }

        }
    }

    var detailView: some View {
        ScrollView {
            let message = if let selectedPartID, let part = Self.partDic[selectedPartID] {
                "\(part.name) detail\n\n" + SampleText.longText
            } else {
                "..."
            }
            Text(message)
                .padding()
                //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .toolbar {
            ToolbarItemGroup {
                Button("Reload", systemImage: "arrow.clockwise") {
                }
                .help("Reload")
            }

            ToolbarSpacer(.fixed)

            ToolbarItemGroup {
                Button("New File", systemImage: "square.and.pencil") {
                }
                .help("New File")

                Button("New File...", systemImage: "bubble.and.pencil") {
                }
                .help("New File...")

                Button("New Folder", systemImage: "folder.badge.plus") {
                }
                .help("New Folder")

                Button("Show History", systemImage: "clock") {
                }
                .help("Show History")
            }

            ToolbarSpacer(.fixed)

            ToolbarItem {
                Button("Search", systemImage: "magnifyingglass") {
                }
                .help("Search")
            }

            ToolbarSpacer(.fixed)

            ToolbarItem {
                Button {
                    isInspectorPresented.toggle()
                } label: {
                    Image(systemName: "sidebar.right")
                        .help("Inspector")
                }
            }
        }
        //.toolbar(removing: .title)
        //.scrollEdgeEffectStyle(.hard, for: .top) // 컨텐츠가 툴바 아래를 지날 때 비쳐보이지 않게 한다.
    }

    func initView() {
        selectedProductID = Self.productTable[0].id
    }
}

#Preview {
    NavigationSplitViewExample()
}
