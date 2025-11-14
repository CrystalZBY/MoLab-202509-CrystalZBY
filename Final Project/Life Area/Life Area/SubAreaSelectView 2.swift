import SwiftUI

struct SubAreaSelectView: View {
    let area: String

    var body: some View {
        List {
            Section(header: Text("Selected Area")) {
                Text(area)
                    .font(.headline)
            }

            Section("Sub-areas") {
                // Placeholder sub-areas; replace with real data later
                Text("Energy / Alertness")
                Text("Mood / Emotions")
                Text("Focus / Attention")
                Text("Body Sensations")
            }
        }
        .navigationTitle("Choose a Sub-area")
    }
}

#Preview {
    NavigationStack {
        SubAreaSelectView(area: "Sleep")
    }
}
