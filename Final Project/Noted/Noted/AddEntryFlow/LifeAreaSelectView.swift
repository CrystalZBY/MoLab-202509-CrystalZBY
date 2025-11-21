//
//  AreaSelectView.swift
//  Noted
//
//  Created by Crystal Zhang on 11/21/25.
//

import SwiftUI

struct LifeAreaSelectView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                // Card background
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.secondarySystemBackground))
                    .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 6)

                // Content inside the card
                List {
                    Section("Life Areas") {
                        NavigationLink("Sleep") { SubLifeAreaSelectView(area: "Sleep") }
                        NavigationLink("Food") { SubLifeAreaSelectView(area: "Food") }
                        NavigationLink("Movement (exercise, stretching, walking, yoga, etc.)") { SubLifeAreaSelectView(area: "Movement") }
                        NavigationLink("Nutrition (hydration, food, caffeine, etc.)") { SubLifeAreaSelectView(area: "Nutrition") }
                        NavigationLink("Daily Rhythm (wake-up and pre-sleep)") { SubLifeAreaSelectView(area: "Daily Rhythm") }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
        .navigationTitle("What part of your life do you want to tune into now?")
    }
}

#Preview {
    NavigationStack {
        LifeAreaSelectView()
    }
}
