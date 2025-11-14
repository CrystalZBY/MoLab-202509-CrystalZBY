//
//  ContentView.swift
//  Heartbeat
//
//  Created by Crystal Zhang on 11/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showAreaSelectView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationStack {
                List {
                    Text("No logs yet. Tap + to start a new entry.")
                        .foregroundStyle(.secondary)
                        .padding(.vertical, 12)

                }
                .navigationTitle("Noted")
                .navigationDestination(isPresented: $showAreaSelectView) {
                    AreaSelectView()
                }
            }
            
            Button(action: {
                showAreaSelectView = true
                print("Start log entry tapped")
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(Circle().fill(Color.accentColor))
                    .shadow(radius: 4, y: 2)
            }
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            .accessibilityLabel("Start log entry")
        }
    }
}

#Preview {
    ContentView()
}
