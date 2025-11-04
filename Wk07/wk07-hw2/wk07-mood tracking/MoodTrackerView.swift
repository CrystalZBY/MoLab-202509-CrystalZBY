import SwiftUI

struct MoodTrackerView: View {
    @State private var mood: Double =  0.5
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                Text("Take a deep breath. What are you feeling now?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)

                VStack(spacing: 8) {
                    
                    
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

                NavigationLink {
                    MoodTrackerView()
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .font(.title3)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom)
        }
    }
}

#Preview {
     MoodTrackerView()
}
