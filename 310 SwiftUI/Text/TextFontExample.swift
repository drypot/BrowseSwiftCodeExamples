//
//  TextFontExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/19/26.
//

import SwiftUI

struct TextFontExample: View {
    @ScaledMetric var customFontSize = 16

    let sampleText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                fontList
            }
            .textSelection(.enabled)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity)
    }

    var fontList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.largeTitle)
            Text(".font(.largeTitle)").padding(.bottom)

            Text(sampleText).font(.title)
            Text(".font(.title)").padding(.bottom)

            Text(sampleText).font(.title2)
            Text(".font(.title2)").padding(.bottom)

            Text(sampleText).font(.title3)
            Text(".font(.title3)").padding(.bottom)

            Text(sampleText).font(.headline)
            Text(".font(.headline)").padding(.bottom)

            Text(sampleText).font(.subheadline)
            Text(".font(.subheadline)").padding(.bottom)

            Text(sampleText).font(.body)
            Text(".font(.body)").padding(.bottom)

            Text(sampleText).font(.callout)
            Text(".font(.callout)").padding(.bottom)

            Text(sampleText).font(.caption)
            Text(".font(.caption)").padding(.bottom)

            Text(sampleText).font(.caption2)
            Text(".font(.caption2)").padding(.bottom)

            Text(sampleText).font(.footnote)
            Text(".font(.footnote)").padding(.bottom)

            Text(sampleText).font(.system(.title, design: .default, weight: .medium))
            Text(".font(.system(.title, design: .default, weight: .medium))").padding(.bottom)

            Text(sampleText).font(.system(size: customFontSize, weight: .medium, design: .default))
            Text(".font(.system(size: ..., weight: .medium, design: .default))").padding(.bottom)

            Text(sampleText).font(.custom("Arial", size: customFontSize))
            Text(".custom(\"Arial\", size: ...)").padding(.bottom)
        }
    }
}
