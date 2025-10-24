//
//  ContentView.swift
//  wk07-hw2
//
//  Created by Crystal Zhang on 10/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Text("State of Mind")
                .font(.title)
                .bold()
            
            Text("Take a deep breath. What are you feeling now?")
                .font(.title)
                .padding(.bottom, 15)

             NavigationLink("Log") {
              MoodTrackerView()
              }
               .buttonStyle(.borderedProminent)
            .font(.title)
            }
            .padding()
        }
    }

#Preview {
    ContentView()
}
