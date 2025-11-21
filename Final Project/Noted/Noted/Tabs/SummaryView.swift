//
//  SummaryView.swift
//  Noted
//
//  Created by Crystal Zhang on 11/21/25.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "chart.bar.xaxis")
                    .font(.system(size: 40))
                    .foregroundStyle(.secondary)
                Text("Summary")
                    .font(.title2)
                Text("Insights and trends will appear here.")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Summary")
        }
    }
}
