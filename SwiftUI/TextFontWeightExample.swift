//
//  TextFontWeightExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/20/26.
//

import SwiftUI

struct TextFontWeightExample: View {
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
            Text(sampleText).fontWeight(.black)
            Text(".fontWeight(.black)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.heavy)
            Text(".fontWeight(.heavy)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.bold)
            Text(".fontWeight(.bold)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.semibold)
            Text(".fontWeight(.semibold)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.medium)
            Text(".fontWeight(.medium)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.regular)
            Text(".fontWeight(.regular)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.light)
            Text(".fontWeight(.light)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.thin)
            Text(".fontWeight(.thin)").font(.caption).padding(.bottom)

            Text(sampleText).fontWeight(.ultraLight)
            Text(".fontWeight(.ultraLight)").font(.caption).padding(.bottom)
        }
        .textSelection(.enabled)
    }
}
