//
//  TextFontExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/19/26.
//

import SwiftUI

struct TextFontExample: View {
    @Environment(Example.self) private var example

    @ScaledMetric var customFontSize = 16

    let sampleText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            exampleHeader
            exampleBody
        }
    }

    var exampleHeader: some View {
        ExampleHeader(example: example)
    }

    var exampleBody: some View {
        ScrollView {
            textList
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity)
    }

    var textList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.largeTitle)
            Text(".font(.largeTitle)").font(.caption).padding(.bottom)

            Text(sampleText).font(.title)
            Text(".font(.title)").font(.caption).padding(.bottom)

            Text(sampleText).font(.title2)
            Text(".font(.title2)").font(.caption).padding(.bottom)

            Text(sampleText).font(.title3)
            Text(".font(.title3)").font(.caption).padding(.bottom)

            Text(sampleText).font(.headline)
            Text(".font(.headline)").font(.caption).padding(.bottom)

            Text(sampleText).font(.subheadline)
            Text(".font(.subheadline)").font(.caption).padding(.bottom)

            Text(sampleText).font(.body)
            Text(".font(.body)").font(.caption).padding(.bottom)

            Text(sampleText).font(.callout)
            Text(".font(.callout)").font(.caption).padding(.bottom)

            Text(sampleText).font(.caption)
            Text(".font(.caption)").font(.caption).padding(.bottom)

            Text(sampleText).font(.caption2)
            Text(".font(.caption2)").font(.caption).padding(.bottom)

            Text(sampleText).font(.footnote)
            Text(".font(.footnote)").font(.caption).padding(.bottom)

            Text(sampleText).font(.system(.title, design: .default, weight: .medium))
            Text(".font(.system(.title, design: .default, weight: .medium))").font(.caption).padding(.bottom)

            Text(sampleText).font(.system(size: customFontSize, weight: .medium, design: .default))
            Text(".font(.system(size: ..., weight: .medium, design: .default))").font(.caption).padding(.bottom)

            Text(sampleText).font(.custom("Arial", size: customFontSize))
            Text(".custom(\"Arial\", size: ...)").font(.caption).padding(.bottom)
        }
        .textSelection(.enabled)
    }
}
