//
//  TreeExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/28/26.
//

import SwiftUI

fileprivate final class FolderState: Identifiable, Hashable {
    let id: Int
    var name: String
    var children: [FolderState]?

    init(id: Int, name: String, children: [FolderState]? = nil) {
        self.id = id
        self.name = name
        self.children = children
    }

    static func == (lhs: FolderState, rhs: FolderState) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@Observable
fileprivate final class AppState {
    let folder1 = FolderState(id: 1, name: "Folder 1")
    let folder2 = FolderState(id: 2, name: "Folder 2")
    let folder3 = FolderState(id: 3, name: "Folder 3")
    let folder4 = FolderState(id: 4, name: "Folder 4")
    let folder5 = FolderState(id: 5, name: "Folder 5")
    let folder6 = FolderState(id: 6, name: "Folder 6")
    let folder7 = FolderState(id: 7, name: "Folder 7")
    let folder8 = FolderState(id: 8, name: "Folder 8")
    let folder9 = FolderState(id: 9, name: "Folder 9")
    let root = FolderState(id: 0, name: "Root")

    var expanded: Set<FolderState.ID> = []
    var selection: Set<FolderState.ID> = []

    let allFolders: [FolderState]

    init() {
        root.children = [folder1, folder2]
        folder1.children = [folder3, folder4]
        folder2.children = [folder5, folder6]
        folder5.children = [folder7, folder8]
        folder6.children = [folder9]
        allFolders = [root, folder1, folder2, folder3, folder4, folder5, folder6, folder7, folder8, folder9]
    }

    func expandAll() {
        let filteredIDs = allFolders.compactMap { $0.children != nil ? $0.id : nil }
        expanded = Set(filteredIDs)
    }

    func collapseAll() {
        expanded.removeAll()
    }

    func selectFolder7() {
        if let parentIDs = parentIDs(of: folder7.id) {
            expanded.formUnion(parentIDs)
        }
        selection = [folder7.id]
        print(expanded)
    }

    func parentIDs(of id: FolderState.ID) -> [FolderState.ID]? {
        var ids: [FolderState.ID] = []

        func parentIDs(of id: FolderState.ID, in folder: FolderState) -> Bool {
            if folder.id == id {
                return true
            }

            guard let children = folder.children else { return false }
            for child in children {
                if parentIDs(of: id, in: child) {
                    ids.append(folder.id)
                    return true
                }
            }

            return false
        }
        
        return parentIDs(of: id, in: root) ? ids : nil
    }
}

struct TreeExample: View {
    @State private var appState = AppState()

    var body: some View {
        NavigationSplitView {
            FolderTreeView(appState: appState)
        } detail: {
            detailBody
        }
    }

    var detailBody: some View {
        VStack(alignment: .leading) {
            Button("Expand All") {
                appState.expandAll()
            }
            Button("Collapse All") {
                appState.collapseAll()
            }
            Button("Select Folder 7") {
                appState.selectFolder7()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

fileprivate struct FolderTreeView: View {
    @Bindable var appState: AppState

    var body: some View {
        List(selection: $appState.selection) {
            TreeRow(folder: appState.root, expanded: $appState.expanded)
        }
    }
}

fileprivate struct TreeRow: View {
    let folder: FolderState
    @Binding var expanded: Set<FolderState.ID>

    var body: some View {
        if let children = folder.children {
            let isExpandedBinding = Binding(
                get: { expanded.contains(folder.id) },
                set: {
                    if $0 {
                        expanded.insert(folder.id)
                    } else {
                        expanded.remove(folder.id)
                    }
                }
            )
            DisclosureGroup(isExpanded: isExpandedBinding) {
                ForEach(children) { child in
                    TreeRow(folder: child, expanded: $expanded)
                }
            } label: {
                Text(folder.name)
            }
        } else {
            Text(folder.name)
        }
    }
}

// Crash 난다.
//
//#Preview {
//    TreeExample()
//}
