import SwiftUI

@main
// add the store to my encironment
struct wk08App: App {
    @StateObject private var store = MoodStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
