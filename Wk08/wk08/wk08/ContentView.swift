import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Log an emotion")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                NavigationLink("Log") {
                    MoodTrackerView()
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("State of Mind")
        }
    }
}

#Preview {
    ContentView()
}
