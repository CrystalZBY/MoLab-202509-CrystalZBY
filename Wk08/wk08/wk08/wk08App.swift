//
//  wk08App.swift
//  wk08
//
//  Created by Crystal Zhang on 11/4/25.
//

import SwiftUI

@main
struct wk08App: App {
    @StateObject private var store = MoodStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
