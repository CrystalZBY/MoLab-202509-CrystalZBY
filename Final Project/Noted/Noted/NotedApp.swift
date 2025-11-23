//
//  DoodleApp.swift
//  Doodle
//
//  Created by Crystal Zhang on 11/6/25.
//

import SwiftUI

@main
struct NotedApp: App {
    @StateObject private var store = DataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
