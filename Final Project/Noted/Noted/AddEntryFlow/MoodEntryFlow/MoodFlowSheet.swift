import SwiftUI

struct MoodFlowSheet: View {
    @Binding var isPresented: Bool
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            MoodTrackerView { selectedLabel in
                // push next “card” inside the sheet
                path.append(Route.moodSelect(selectedLabel))
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .moodSelect(let label):
                    MoodSelectView(emotionLabel: label) {
                        isPresented = false
                    }
                }
            }
            .navigationTitle("How are you feeling?")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

enum Route: Hashable {
    case moodSelect(String)
}
