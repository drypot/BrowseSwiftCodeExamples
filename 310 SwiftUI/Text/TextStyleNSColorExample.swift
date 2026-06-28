//
//  TextStyleNSColorExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/20/26.
//

import SwiftUI

struct TextStyleNSColorExample: View {
    let sampleText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                labelColorList
                textColorList
                contentColorList
                menuColorList
                tableColorList
                controlColorList
                windowColorList
                highlightColorList
                fillColorList
            }
            .textSelection(.enabled)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity)
    }

    var labelColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .labelColor))
            Text(".foregroundStyle(Color(nsColor: .labelColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
            Text(".foregroundStyle(Color(nsColor: .secondaryLabelColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .tertiaryLabelColor))
            Text(".foregroundStyle(Color(nsColor: .tertiaryLabelColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .quaternaryLabelColor))
            Text(".foregroundStyle(Color(nsColor: .quaternaryLabelColor))").padding(.bottom)
        }
    }

    var textColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .textBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .textColor))")
            Text(".background(Color(nsColor: .textBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .placeholderTextColor))
                .background(Color(nsColor: .textBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .placeholderTextColor))")
            Text(".background(Color(nsColor: .textBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .selectedTextColor))
                .background(Color(nsColor: .selectedTextBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .selectedTextColor))")
            Text(".background(Color(nsColor: .selectedTextBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .unemphasizedSelectedTextColor))
                .background(Color(nsColor: .unemphasizedSelectedTextBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .unemphasizedSelectedTextColor))")
            Text(".background(Color(nsColor: .unemphasizedSelectedTextBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .keyboardFocusIndicatorColor))
                .background(Color(nsColor: .textBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .keyboardFocusIndicatorColor))")
            Text(".background(Color(nsColor: .textBackgroundColor))").padding(.bottom)
        }
    }

    var contentColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .linkColor))
            Text(".foregroundStyle(Color(nsColor: .linkColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .separatorColor))
            Text(".foregroundStyle(Color(nsColor: .separatorColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .selectedTextColor))
                .background(Color(nsColor: .selectedContentBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .selectedTextColor))")
            Text(".background(Color(nsColor: .selectedContentBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .selectedTextColor))
                .background(Color(nsColor: .unemphasizedSelectedContentBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .selectedTextColor))")
            Text(".background(Color(nsColor: .unemphasizedSelectedContentBackgroundColor))").padding(.bottom)
        }
    }

    var menuColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .selectedMenuItemTextColor))
                .background(Color(nsColor: .selectedContentBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .selectedMenuItemTextColor))")
            Text(".background(Color(nsColor: .selectedContentBackgroundColor))").padding(.bottom)
        }
    }

    var tableColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .gridColor))
            Text(".foregroundStyle(Color(nsColor: .gridColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .headerTextColor))
            Text(".foregroundStyle(Color(nsColor: .headerTextColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .alternatingContentBackgroundColors[0]))
            Text(".foregroundStyle(Color(nsColor: .textColor))")
            Text(".background(Color(nsColor: .alternatingContentBackgroundColors[0]))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .alternatingContentBackgroundColors[1]))
            Text(".foregroundStyle(Color(nsColor: .textColor))")
            Text(".background(Color(nsColor: .alternatingContentBackgroundColors[1]))").padding(.bottom)
        }
    }

    var controlColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .controlAccentColor))
            Text(".foregroundStyle(Color(nsColor: .controlAccentColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .controlTextColor))
                .background(Color(nsColor: .controlColor))
            Text(".foregroundStyle(Color(nsColor: .controlTextColor))")
            Text(".background(Color(nsColor: .controlColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .controlTextColor))
                .background(Color(nsColor: .controlBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .controlTextColor))")
            Text(".background(Color(nsColor: .controlBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .disabledControlTextColor))
                .background(Color(nsColor: .controlBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .disabledControlTextColor))")
            Text(".background(Color(nsColor: .controlBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .selectedControlTextColor))
                .background(Color(nsColor: .selectedControlColor))
            Text(".foregroundStyle(Color(nsColor: .selectedControlTextColor))")
            Text(".background(Color(nsColor: .selectedControlColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .alternateSelectedControlTextColor))
                .background(Color(nsColor: .selectedControlColor))
            Text(".foregroundStyle(Color(nsColor: .alternateSelectedControlTextColor))")
            Text(".background(Color(nsColor: .selectedControlColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .alternateSelectedControlTextColor))
                .background(Color(nsColor: .controlAccentColor))
            Text(".foregroundStyle(Color(nsColor: .alternateSelectedControlTextColor))")
            Text(".background(Color(nsColor: .controlAccentColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .controlTextColor))
                .background(Color(nsColor: .scrubberTexturedBackground))
            Text(".foregroundStyle(Color(nsColor: .controlTextColor))")
            Text(".background(Color(nsColor: .scrubberTexturedBackground))").padding(.bottom)
        }
    }

    var windowColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .windowBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .textColor))")
            Text(".background(Color(nsColor: .windowBackgroundColor))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .windowFrameTextColor))
                .background(Color(nsColor: .windowBackgroundColor))
            Text(".foregroundStyle(Color(nsColor: .windowFrameTextColor))")
            Text(".background(Color(nsColor: .windowBackgroundColor))").padding(.bottom)
        }
    }

    var highlightColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .textColor))
                .background(Color(nsColor: .findHighlightColor))
            Text(".foregroundStyle(Color(nsColor: .textColor))")
            Text(".background(Color(nsColor: .findHighlightColor))").padding(.bottom)
        }
    }

    var fillColorList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .labelColor))
                .background(Color(nsColor: .systemFill))
            Text(".foregroundStyle(Color(nsColor: .labelColor))")
            Text(".background(Color(nsColor: .systemFill))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
                .background(Color(nsColor: .secondarySystemFill))
            Text(".foregroundStyle(Color(nsColor: .secondaryLabelColor))")
            Text(".background(Color(nsColor: .secondarySystemFill))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .tertiaryLabelColor))
                .background(Color(nsColor: .tertiarySystemFill))
            Text(".foregroundStyle(Color(nsColor: .tertiaryLabelColor))")
            Text(".background(Color(nsColor: .tertiarySystemFill))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .quaternaryLabelColor))
                .background(Color(nsColor: .quaternarySystemFill))
            Text(".foregroundStyle(Color(nsColor: .quaternaryLabelColor))")
            Text(".background(Color(nsColor: .quaternarySystemFill))").padding(.bottom)

            Text(sampleText).font(.title)
                .foregroundStyle(Color(nsColor: .quinaryLabel))
                .background(Color(nsColor: .quinarySystemFill))
            Text(".foregroundStyle(Color(nsColor: .quinaryLabel))")
            Text(".background(Color(nsColor: .quinarySystemFill))").padding(.bottom)
        }
    }
}
