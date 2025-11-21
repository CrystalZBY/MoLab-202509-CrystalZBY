import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var store: DataStore
    @State private var showingLogSheet = false

    var body: some View {
        let entries = store.moodEntries

        NavigationStack {
            List {
                if entries.isEmpty {
                    Section {
                        VStack(spacing: 8) {
                            Image(systemName: "face.smiling")
                                .font(.system(size: 40))
                                .foregroundStyle(.secondary)
                            Text("No Mood Entries Yet")
                                .font(.headline)
                            Text("Tap “+” to log how you’re feeling.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 24)
                    }
                } else {
                    ForEach(entries) { entry in
                        MoodHistoryRow(entry: entry)
                    }
//                    .onDelete(perform: store.remove)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("State of Mind")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingLogSheet = true
                    } label: {
                        Label("Log", systemImage: "plus.circle.fill")
                    }
                }
                if !entries.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $showingLogSheet) {
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
    let store = DataStore()
//    store.clearAll()
    // Preload a couple of examples for the preview
//    store.add(emotionLabel: "Pleasant", feelings: ["Calm", "Grateful"])
//    store.add(emotionLabel: "Neutral", feelings: [])
    HistoryView()
        .environmentObject(store)
}
