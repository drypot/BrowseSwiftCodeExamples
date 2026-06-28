//
//  TextStyleExample.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/22/26.
//

import SwiftUI

struct TextStyleExample: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                systemColorList
                hierarchicalList
                semanticList
                materialList
                shapeList
            }
            .textSelection(.enabled)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity)
    }

    var systemColorList: some View {
        VStack(alignment: .leading) {
            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.black)
            Text(".foregroundStyle(.black)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.blue)
            Text(".foregroundStyle(.blue)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.brown)
            Text(".foregroundStyle(.brown)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.cyan)
            Text(".foregroundStyle(.cyan)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.gray)
            Text(".foregroundStyle(.gray)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.green)
            Text(".foregroundStyle(.green)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.indigo)
            Text(".foregroundStyle(.indigo)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.mint)
            Text(".foregroundStyle(.mint)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.orange)
            Text(".foregroundStyle(.orange)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.pink)
            Text(".foregroundStyle(.pink)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.purple)
            Text(".foregroundStyle(.purple)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.red)
            Text(".foregroundStyle(.red)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.teal)
            Text(".foregroundStyle(.teal)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.yellow)
            Text(".foregroundStyle(.yellow)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.white)
                .background(.gray)
            Text(".foregroundStyle(.white)")
            Text(".background(.gray)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.clear)
                .background(.gray)
            Text(".foregroundStyle(.clear)")
            Text(".background(.gray)").padding(.bottom)

        }
    }

    var hierarchicalList: some View {
        VStack(alignment: .leading) {
            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.primary)
            Text(".foregroundStyle(.primary)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.secondary)
            Text(".foregroundStyle(.secondary)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.tertiary)
            Text(".foregroundStyle(.tertiary)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.quaternary)
            Text(".foregroundStyle(.quaternary)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.quinary)
            Text(".foregroundStyle(.quinary)").padding(.bottom)
        }
    }

    var semanticList: some View {
        VStack(alignment: .leading) {
            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.background)
            Text(".foregroundStyle(.foreground)")
            Text(".background(.background)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.windowBackground)
            Text(".foregroundStyle(.foreground)")
            Text(".background(.windowBackground)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.selection)
            Text(".foregroundStyle(.foreground)")
            Text(".background(.selection)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.fill)
            Text(".foregroundStyle(.foreground)")
            Text(".background(.fill)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.tint)
            Text(".foregroundStyle(.tint)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.placeholder)
            Text(".foregroundStyle(.placeholder)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.link)
            Text(".foregroundStyle(.link)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.separator)
            Text(".foregroundStyle(.separator)").padding(.bottom)

        }
    }

    var materialList: some View {
        VStack(alignment: .leading) {
            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.ultraThinMaterial)
            Text(".background(.ultraThinMaterial)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.thinMaterial)
            Text(".background(.thinMaterial)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.regularMaterial)
            Text(".background(.regularMaterial)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.thickMaterial)
            Text(".background(.thickMaterial)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .foregroundStyle(.foreground)
                .background(.ultraThickMaterial)
            Text(".background(.ultraThickMaterial)").padding(.bottom)

        }
    }

    var shapeList: some View {
        VStack(alignment: .leading) {
            Text(SampleText.sentence).font(.title)
                .padding(4)
                .background(.yellow.gradient)
            Text(".background(.yellow.gradient)").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .padding(4)
                .background(.yellow, in: Capsule())
            Text(".background(.yellow, in: Capsule())").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .padding(4)
                .background { RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)) }
            Text(".background { RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)) }").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .padding(4)
                .background { RoundedRectangle(cornerRadius: 8).fill(.yellow) }
            Text(".background { RoundedRectangle(cornerRadius: 8).fill(.yellow) }").padding(.bottom)

            Text(SampleText.sentence).font(.title)
                .padding(4)
                .background {
                    Rectangle()
                        .foregroundStyle(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .shadow(radius: 8)
                }
            Text(".background { Rectangle().foregroundStyle(.yellow).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)).shadow(radius: 8) }").padding(.bottom)
        }
    }
}

#Preview {
    TextStyleExample()
}
