//
//  ContentView.swift
//  Wk03 - no.1 app
//
//  Created by Crystal Zhang on 9/25/25.
//

import SwiftUI

struct Page1: View {
    let elements = ["🌿", "🌳", "☘️", "🌱", "🌲", "🌵"]

        // Size of grid
        let rows = 20
        let columns = 20
        
        var body: some View {
            VStack(spacing: 2) {
                ForEach(0..<rows, id: \.self) { _ in
                    HStack(spacing: 2) {
                        ForEach(0..<columns, id: \.self) { _ in
                            // Pick a random element from array
                            Text(elements.randomElement()!)
                                .font(.system(size: 16))
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
            .padding()
        }
}

#Preview {
    Page1()
}
