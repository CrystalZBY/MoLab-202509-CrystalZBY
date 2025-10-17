//
//  ContentView.swift
//  Wk06-hw
//
//  Created by Crystal Zhang on 10/17/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"
    @AppStorage("score") var score:Int = 0
    
    @State private var audioPlayer: AVAudioPlayer?
    
    private func playSoundOnce(named name: String, withExtension ext: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("Audio file not found: \(name).\(ext)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = 0
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Failed to initialize audio player: \(error)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Welcome, \(username)")
                .font(Font.system(size: 15, weight: .bold))
                .padding(.top, 24)
            HStack {
                Button("Log in") {
                    username = "someone"
                }
                Button("Log out") {
                    username = "Anonymous"
                }
            }
            
            Text("Click on Wooden Fish to gain good fortune!")
                .font(Font.system(size: 15, weight: .bold))
                .padding(.top, 15)
            Spacer()
            
            Text("Good fortune")
                .font(Font.system(size: 30, weight: .bold))
            Text("+ \(score)")
                .font(Font.system(size: 30, weight: .bold))
            
            // Center image button that increments score
            Button(action: {
                score += 1
                playSoundOnce(named: "mokugyo", withExtension: "wav")
            }) {
                Image("wooden fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.yellow)
                    .shadow(radius: 4)
                    .padding(.vertical, 16)
            }
            .accessibilityLabel("Add point")
            
//            HStack {
//                Button("+ Score") {
//                    score += 1
//                }
//                Button("- Score") {
//                    score -= 1
//                }
//            }
            
            Spacer()
            Button("Clear good fortune") {
                score = 0
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
