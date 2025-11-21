//
//  SubLifeAreaSelectView.swift
//  Noted
//
//  Created by Crystal Zhang on 11/21/25.
//

import SwiftUI

struct SubLifeAreaSelectView: View {
    let area: String

    var body: some View {
        List {
            Section(header: Text("Selected Area")) {
                Text(area)
                    .font(.headline)
            }

            Section("Sub-areas") {
                // Placeholder sub-areas, will replace with real data later
                Text("Energy / Alertness")
                Text("Mood / Emotions")
                Text("Focus / Attention")
                Text("Body Sensations")
            }
        }
        .navigationTitle("Choose a Sub-area")
    }
}

#Preview {
    NavigationStack {
        SubLifeAreaSelectView(area: "Sleep")
    }
}
