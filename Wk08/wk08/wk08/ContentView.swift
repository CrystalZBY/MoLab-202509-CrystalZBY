import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: MoodStore
    @State private var showingLogSheet = false

    var body: some View {
        NavigationStack {
            Group {
                if store.entries.isEmpty {
                    // Nice empty state when there's no data yet
                    ContentUnavailableView(
                        "No Mood Entries Yet",
                        systemImage: "face.smiling",
                        description: Text("Tap “Log” to record how you’re feeling.")
                    )
                } else {
                    List {
                        ForEach(store.entries) { entry in
                            MoodHistoryRow(entry: entry)
                        }
                        .onDelete(perform: store.remove)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("State of Mind")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingLogSheet = true
                    } label: {
                        Label("Log", systemImage: "plus.circle.fill")
                    }
                }
                if !store.entries.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $showingLogSheet) {
                // Your “cards” flow hosted inside a sheet
                MoodFlowSheet(isPresented: $showingLogSheet)
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

private struct MoodHistoryRow: View {
    let entry: MoodEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline) {
                Text(entry.emotionLabel)
                    .font(.headline)
                Spacer()
                // Date + time on the trailing side
                Text(entry.date, style: .date)
                    .foregroundStyle(.secondary)
                Text(entry.date, style: .time)
                    .foregroundStyle(.secondary)
            }
            if !entry.feelings.isEmpty {
                Text(entry.feelings.joined(separator: " • "))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "\(entry.emotionLabel), \(entry.date.formatted(date: .abbreviated, time: .shortened))"
            + (entry.feelings.isEmpty ? "" : ", " + entry.feelings.joined(separator: ", "))
        )
    }
}

#Preview {
    // Preview with sample data
    let store = MoodStore()
    store.clearAll()
    // Preload a couple of examples for the preview
    store.add(emotionLabel: "Pleasant", feelings: ["Calm", "Grateful"])
    store.add(emotionLabel: "Neutral", feelings: [])
    return ContentView()
        .environmentObject(store)
}
