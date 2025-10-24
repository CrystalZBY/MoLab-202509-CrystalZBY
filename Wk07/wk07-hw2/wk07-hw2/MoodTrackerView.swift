import SwiftUI

struct MoodTrackerView: View {
    @State private var mood: Double =  0.5
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Choose how you're feeling right now")
                
                
                
                Slider(value: $mood, in: 0...1)
                HStack{
                    Text("Very Unpleasant")
                    Spacer()
                    Text("Very Pleasant")
                }
                
                NavigationLink("Next") {
                    AddImageViewCamera()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal, 25)
        }
    }
}

