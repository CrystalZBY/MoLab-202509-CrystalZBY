import SwiftUI

struct ContentView: View {
    @State private var showingLogSheet = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Log an emotion")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Button("Log") {
                    showingLogSheet = true
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .padding(.top, 8)
                .sheet(isPresented: $showingLogSheet) {
                    MoodFlowSheet(isPresented: $showingLogSheet)
                        .presentationDetents([.large, .large])
                        .presentationDragIndicator(.visible)
                }
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
