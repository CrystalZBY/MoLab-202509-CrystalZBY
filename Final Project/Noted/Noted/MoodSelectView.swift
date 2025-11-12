import SwiftUI

struct MoodSelectView: View {
    let emotionLabel: String
    let finishFlow: () -> Void

    @EnvironmentObject private var store: MoodStore
    @Environment(\.dismiss) private var dismiss
    @State private var selectedFeelings: Set<Feeling> = []

    private var feelingsForCurrentMood: [Feeling] {
        switch emotionLabel.lowercased() {
        case "very unpleasant", "unpleasant":
            return negativeFeelings
        case "neutral":
            return neutralFeelings
        case "pleasant", "very pleasant":
            return positiveFeelings
        default:
            return positiveFeelings
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
//                Text(emotionLabel)
//                    .font(.title)
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.center)

            Text("What best describes this feeling?")
                .font(.title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)

            Spacer(minLength: 0)

            // Simple adaptive grid of selectable chips
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 12)], spacing: 12) {
                ForEach(feelingsForCurrentMood) { feeling in
                    FeelingChip(label: feeling.label, isSelected: selectedFeelings.contains(feeling)) {
                        if selectedFeelings.contains(feeling) {
                            selectedFeelings.remove(feeling)
                        } else {
                            selectedFeelings.insert(feeling)
                        }
                    }
                }
            }

            Button {
                let feelingLabels = selectedFeelings.map(\.label).sorted()
                store.add(emotionLabel: emotionLabel, feelings: feelingLabels) //save JSON
                finishFlow()
            } label: {
                Text("Done")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .font(.title3)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .padding(.bottom)

        // Make the selected emotion the navigation title
        .navigationTitle(emotionLabel)
        .navigationBarTitleDisplayMode(.inline) // or .large if you prefer
    }
}

struct Feeling: Identifiable, Hashable {
    let id = UUID()
    let label: String
}

let positiveFeelings: [Feeling] = [
    Feeling(label: "Happy"),
    Feeling(label: "Joyful"),
    Feeling(label: "Inspired"),
    Feeling(label: "Excited"),
    Feeling(label: "Proud"),
    Feeling(label: "Grateful"),
    Feeling(label: "Calm"),
    Feeling(label: "Optimistic"),
]

let neutralFeelings: [Feeling] = [
    Feeling(label: "Okay"),
    Feeling(label: "Indifferent"),
    Feeling(label: "Drained"),
    Feeling(label: "Calm"),
    Feeling(label: "Balanced"),
    Feeling(label: "Unmoved"),
]

let negativeFeelings: [Feeling] = [
    Feeling(label: "Sad"),
    Feeling(label: "Angry"),
    Feeling(label: "Anxious"),
    Feeling(label: "Frustrated"),
    Feeling(label: "Lonely"),
    Feeling(label: "Guilty"),
    Feeling(label: "Tired"),
    Feeling(label: "Confused"),
    Feeling(label: "Overwhelmed"),
]

private struct FeelingChip: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Text(label)
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.accentColor.opacity(0.7) : Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .contentShape(Rectangle())
            .onTapGesture(perform: action)
    }

}

//#Preview {
//    MoodSelectView(emotionLabel: "Pleasant", finishFlow: {})
//}
