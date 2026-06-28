//
//  FormExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/23/26.
//

import SwiftUI

@Observable
fileprivate class FormState {
    var fontName = "Menlo"
    var fontSize = 16.0
    var lineHeightMultiple = 1.3

    var lineSpacing: Double {
        (lineHeightMultiple - 1) * fontSize
    }

    var isAutoSaveEnabled = true
    var autoSaveDelay = 2

    enum TabKeyAction: Int {
        case `default` = 0
        case indentWithSpace = 1
    }

    var tabKeyAction = TabKeyAction.indentWithSpace
    var indentSize = 4

    func makeNSFont() -> NSFont {
        NSFont(name: fontName, size: fontSize) ?? .systemFont(ofSize: 13)
    }

    private var fontPanelFont: NSFont?

    func showFontPanel() {
        self.fontPanelFont = makeNSFont()
        guard let fontPanelFont else { return }

        let manager = NSFontManager.shared
        manager.target = self
        manager.action = #selector(onFontPanelChange(_:))

        NSFontPanel.shared.setPanelFont(fontPanelFont, isMultiple: false)
        NSFontPanel.shared.makeKeyAndOrderFront(nil)
    }

    @objc func onFontPanelChange(_ sender: Any?) {
        guard let manager = sender as? NSFontManager else { return }
        guard let fontPanelFont else { return }

        let newFont = manager.convert(fontPanelFont)
        self.fontPanelFont = newFont

        fontName = newFont.fontName
        fontSize = newFont.pointSize
    }
}

struct FormExample: View {

    @State private var appState = FormState()
    @State private var sampleText = SampleText.paragraph

    var body: some View {
        Form {
            Section("Font") {
                LabeledContent("Font: \(appState.fontName)") {
                    Button("Change Font") {
                        appState.showFontPanel()
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

                TextEditor(text: $sampleText)
                    .font(Font.custom(appState.fontName, size: appState.fontSize))
                    .lineSpacing(appState.lineSpacing)
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
                    set: { appState.tabKeyAction = FormState.TabKeyAction(rawValue: $0) ?? .default }
                )
                Picker("Tab key action", selection: tabKeyActionBinding) {
                    Text("Insert Tab").tag(FormState.TabKeyAction.default.rawValue)
                    Text("Indent with Space").tag(FormState.TabKeyAction.indentWithSpace.rawValue)
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
}

