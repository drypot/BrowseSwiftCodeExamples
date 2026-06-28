//
//  TextFontWeightExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/20/26.
//

import SwiftUI

struct TextFontWeightExample: View {
    let sampleText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                fontWeightList
            }
            .textSelection(.enabled)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity)
    }

    var fontWeightList: some View {
        VStack(alignment: .leading) {
            Text(sampleText).font(.title).fontWeight(.black)
            Text(".fontWeight(.black)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.heavy)
            Text(".fontWeight(.heavy)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.bold)
            Text(".fontWeight(.bold)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.semibold)
            Text(".fontWeight(.semibold)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.medium)
            Text(".fontWeight(.medium)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.regular)
            Text(".fontWeight(.regular)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.light)
            Text(".fontWeight(.light)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.thin)
            Text(".fontWeight(.thin)").padding(.bottom)

            Text(sampleText).font(.title).fontWeight(.ultraLight)
            Text(".fontWeight(.ultraLight)").padding(.bottom)
        }
    }
}
