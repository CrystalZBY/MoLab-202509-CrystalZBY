import SwiftUI
import AVFoundation

struct EnvironSound: Identifiable {
    let id = UUID()
    let sounds: [SoundItem]
}

struct SoundItem {
    let title: String
    let fileName: String
    let imageName: String
}

let forestSounds = EnvironSound(sounds: [
    SoundItem(title: "Trees", fileName: "Forest Ambience", imageName: "🌳"),
    SoundItem(title: "Crickets", fileName: "Crickets", imageName: "🪲"),
    SoundItem(title: "Soft Wind", fileName: "Soft wind", imageName: "💨"),
    SoundItem(title: "Stream", fileName: "Stream", imageName: "💦")
])

let campingSounds = EnvironSound(sounds: [
    SoundItem(title: "Fireplace", fileName: "Fireplace", imageName: "🔥"),
    SoundItem(title: "Bird Chirp", fileName: "Bird chirp", imageName: "🦜"),
    SoundItem(title: "Soft Wind", fileName: "Soft wind", imageName: "💨"),
    SoundItem(title: "Night Crickets", fileName: "Night crickets", imageName: "🪲")
])

struct SoundView: View {
    @State var player: AVAudioPlayer?
    @State private var players: [AVAudioPlayer?] = [] //multiple sound tracks
    @State private var volumes: [Double] = [] //adjust volume from 0.0 - 1.0
    @State private var isPlaying: [Bool] = [] //track play status
    
    var environmentName: String
    var selectedSounds: [SoundItem] {
        environmentName.lowercased() == "forest" ? forestSounds.sounds : campingSounds.sounds
    }
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack (spacing: 50){
                Text("\(environmentName) Sounds")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(selectedSounds.indices, id: \.self) { index in
                            SoundItemView(
                                item: selectedSounds[index],
                                volume: $volumes[index],
                                isPlaying: $isPlaying[index],
                                togglePlayback: {
                                    if let player = players[index] {
                                        if player.isPlaying {
                                            player.pause()
                                            isPlaying[index] = false
                                        } else {
                                            player.volume = Float(volumes[index])
                                            player.play()
                                            isPlaying[index] = true
                                        }
                                    }
                                }
                            )
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(environmentName)
        //help from SwiftCopilot... maybe not working
        .onAppear {
            players = selectedSounds.map { item in
                if let url = Bundle.main.url(forResource: item.fileName, withExtension: "mp3") {
                    return try? AVAudioPlayer(contentsOf: url)
                }
                return nil
            }
            volumes = Array(repeating: 0.5, count: selectedSounds.count)
            isPlaying = Array(repeating: false, count: selectedSounds.count)
        }
    }
}


struct SoundItemView: View {
    let item: SoundItem
    @Binding var volume: Double
    @Binding var isPlaying: Bool
    var togglePlayback: () -> Void
    
    var body: some View {
        HStack{
            Text(item.imageName)
                .font(.system(size: 32))
                .frame(width: 40)
            
            Text(item.title)
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
            
            Slider(value: $volume, in: 0...1)
                .frame(width: 130)
            Button(action: togglePlayback) {
               Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                   .font(.system(size: 30))
                   .foregroundColor(.white)
           }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
}

//#Preview {
//    NavigationSlides.environment(SoundView())
//}
