//
//  CustomizeView.swift
//  Noted
//
//  Created by Crystal Zhang on 11/21/25.
//

import SwiftUI

struct CustomizeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 40))
                    .foregroundStyle(.secondary)
                Text("Customize")
                    .font(.title2)
                Text("Configure your categories and preferences.")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Customize")
        }
    }
}
