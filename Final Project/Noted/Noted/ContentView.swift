import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .history
    @State private var showingAddSheet = false

    enum Tab: Hashable {
        case history
        case summary
        case customize
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content area switches based on selected tab
            Group {
                switch selectedTab {
                case .history:
                    HistoryView()
                case .summary:
                    SummaryView()
                case .customize:
                    CustomizeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            // Bottom controls overlay
            ZStack(alignment: .bottomLeading) {
                // Custom tab bar anchored bottom-left
                HStack(spacing: 16) {
                    tabButton(label: "History", systemImage: "clock.arrow.circlepath", tab: .history)
                    tabButton(label: "Summary", systemImage: "chart.bar.xaxis", tab: .summary)
                    tabButton(label: "Customize", systemImage: "slider.horizontal.3", tab: .customize)
                }
                .padding(.leading, 16)
                .padding(.bottom, 16)

                // Floating add button anchored bottom-right
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { showingAddSheet = true }) {
                            Image(systemName: "plus")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 56, height: 56)
                                .background(Circle().fill(Color.accentColor))
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                        .accessibilityLabel("Add entry")
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .sheet(isPresented: $showingAddSheet) {
            AddEntryFlowView(isPresented: $showingAddSheet)
        }
    }

    // MARK: - Tab Button
    @ViewBuilder
    private func tabButton(label: String, systemImage: String, tab: Tab) -> some View {
        Button(action: { selectedTab = tab }) {
            HStack(spacing: 6) {
                Image(systemName: systemImage)
                Text(label)
            }
            .font(.system(size: 14, weight: selectedTab == tab ? .semibold : .regular))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(selectedTab == tab ? Color.accentColor.opacity(0.15) : Color(.systemGray5))
            )
        }
        .buttonStyle(.plain)
        .foregroundStyle(selectedTab == tab ? Color.accentColor : .primary)
        .accessibilityLabel("Switch to \(label)")
    }
}

#Preview {
    ContentView()
        .environmentObject(DataStore())
}
