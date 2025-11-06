import SwiftUI

struct MoodTrackerView: View {
    let goToSelect: (String) -> Void
    @State private var mood: Double =  0.5
    
    private var emotionLabel: String {
        switch mood {
        case ..<0.2: return "Very Unpleasant"
        case 0.2..<0.4: return "Unpleasant"
        case 0.4..<0.6: return "Neutral"
        case 0.6..<0.8: return "Pleasant"
        default: return "Very Pleasant"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Take a deep breath. How are you feeling now?")
                .font(.title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)

            VStack(spacing: 8) {
                Text(emotionLabel)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                Slider(value: $mood, in: 0...1)
                    .accessibilityLabel("Current mood")
                    .accessibilityValue(mood < 0.33 ? "Unpleasant" : (mood > 0.66 ? "Pleasant" : "Neutral"))
                HStack {
                    Text("Very Unpleasant")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("Very Pleasant")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer(minLength: 0)

            Button {
                goToSelect(emotionLabel)  // push next card (still inside sheet)
            } label: {
                Text("Next").frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .font(.title3)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .padding(.bottom)
    }
}

//#Preview {
//    MoodTrackerView()
//}
