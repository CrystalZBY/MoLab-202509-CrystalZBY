import SwiftUI

struct MoodSelectView: View {
    let emotionLabel: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(emotionLabel)
                .font(.title)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            Text("What best describes this feeling?")
                .font(.title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer(minLength: 0)

            NavigationLink {
                // Pass the computed label into the next screen
                MoodSelectView(emotionLabel: emotionLabel)
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
        
        // Make the selected emotion the navigation title
        .navigationTitle(emotionLabel)
        .navigationBarTitleDisplayMode(.inline) // or .large if you prefer
    }
}

#Preview {
    MoodSelectView(emotionLabel: "Pleasant")
}
