//
//  ExampleHeader.swift
//  Browse Swift Code Examples
//
//  Created by Kyuhyun Park on 6/18/26.
//

import SwiftUI

struct ExampleHeader: View {
    let example: Example

    var body: some View {
        VStack(alignment: .leading) {
            let urlString = "https://github.com/drypot/BrowseSwiftCodeExamples/blob/main/" + example.relativePath
            let url = URL(string: urlString)!
            Text(example.title).font(.title)
            Link(urlString, destination: url)
        }
        .padding()
        Divider()
    }
}
