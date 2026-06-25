//
//  FormExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/23/26.
//

import SwiftUI

struct FormExample: View {

    @Observable class AppState {
        var sampleText = "Sample text"

        var fontName = "Menlo"
        var fontSize = 16.0
        var lineHeightMultiple = 1.3

        var isAutoSaveEnabled = true
        var autoSaveDelay = 2

        enum TabKeyAction: Int {
            case `default` = 0
            case indentWithSpace = 1
        }

        var tabKeyAction = TabKeyAction.indentWithSpace
        var indentSize = 4

        @ObservationIgnored
        lazy var fontManager = { FontManager(appState: self) }()

        func makeNSFont() -> NSFont {
            NSFont(name: fontName, size: fontSize) ?? .systemFont(ofSize: 13)
        }
    }

    @State private var appState = AppState()

    var body: some View {
        Form {
            Section("Font") {
                LabeledContent("Font: \(appState.fontName)") {
                    Button("Change Font") {
                        appState.fontManager.showFontPanel()
                    }
                }

                Slider(value: $appState.fontSize, in: 8...36, step: 1) {
                    Text("Font size: \(appState.fontSize.formatted()) pt")
                }
                .controlSize(.mini)

                Slider(value: $appState.lineHeightMultiple, in: 1.0...3.0, step: 0.1) {
                    Text("Line height: \(appState.lineHeightMultiple.formatted())x")
                }
                .controlSize(.mini)

                TextEditor(text: $appState.sampleText)
                    .font(Font.custom(appState.fontName, size: appState.fontSize))
                    .frame(minHeight: 120)
            }

            Section("Auto Save") {
                Toggle("Auto save enabled", isOn: $appState.isAutoSaveEnabled)
                    .controlSize(.mini)
                    .toggleStyle(.switch)

                let autoSaveAfterbinding = Binding<Double>(
                    get: { Double(appState.autoSaveDelay) },
                    set: { appState.autoSaveDelay = Int($0) }
                )
                Slider(value: autoSaveAfterbinding, in: 2.0...60.0, step: 2) {
                    Text("Auto save after \(appState.autoSaveDelay.formatted()) seconds")
                }
                .disabled(!appState.isAutoSaveEnabled)
                .controlSize(.mini)

            }

            Section {
                let tabKeyActionBinding = Binding<Int>(
                    get: { appState.tabKeyAction.rawValue },
                    set: { appState.tabKeyAction = AppState.TabKeyAction(rawValue: $0) ?? .default }
                )
                Picker("Tab key action", selection: tabKeyActionBinding) {
                    Text("Insert Tab").tag(AppState.TabKeyAction.default.rawValue)
                    Text("Indent with Space").tag(AppState.TabKeyAction.indentWithSpace.rawValue)
                }

                let indentSizeBinding = Binding<Double>(
                    get: { Double(appState.indentSize) },
                    set: { appState.indentSize = Int($0) }
                )
                Slider(value: indentSizeBinding, in: 2.0...16.0, step: 1) {
                    Text("Indent with \(appState.indentSize.formatted()) spaces")
                }
                .disabled(appState.tabKeyAction != .indentWithSpace)
                .controlSize(.mini)
            } header: {
                Text("Tab Key")
            } footer: {
                HStack {
                    Spacer()
                    Button("Advanced...") { }
                }
            }
        }
        .formStyle(.grouped)
        .navigationTitle("Settings")
        .frame(minWidth: 500, minHeight: 500)
    }

    final class FontManager: NSObject {
        private let appState: AppState
        private var initFont: NSFont?

        init(appState: AppState) {
            self.appState = appState
        }

        func showFontPanel() {
            let initFont = NSFont(name: appState.fontName, size: appState.fontSize) ?? .systemFont(ofSize: 13)
            self.initFont = initFont

            let manager = NSFontManager.shared
            manager.target = self
            manager.action = #selector(onChange(_:))

            NSFontPanel.shared.setPanelFont(initFont, isMultiple: false)
            NSFontPanel.shared.makeKeyAndOrderFront(nil)
        }

        @objc func onChange(_ sender: Any?) {
            guard let manager = sender as? NSFontManager else { return }
            guard let initFont else { return }

            let newFont = manager.convert(initFont)
            self.initFont = newFont

            appState.fontName = newFont.fontName
            appState.fontSize = newFont.pointSize
        }
    }
}

