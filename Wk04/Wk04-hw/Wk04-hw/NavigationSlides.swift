//
//  Navigation.swift
//  Wk04-hw
//
//  Created by Crystal Zhang on 10/9/25.
//

import SwiftUI

let slides = ["Forest", "Camping"]
let environImages = [Image("Forest"), Image("Camping")]

struct NavigationSlides: View {
    @State var slideIndex = 0
    var body: some View {
        NavigationView {
            //make sure navigation view work and push to the next page
            VStack {
                Text("White Noises")
                    .font(Font.system(size: 30, weight: .bold))
                    .padding()
                let name = slides[slideIndex]
                SingleSlide(name: name)
                HStack {
                    Button(action: previousItemAction) {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .padding(.leading, 24) //add sapce to the left edge
                    }
                    .padding()
                    Spacer()
                    Button(action: nextItemAction) {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .padding(.trailing, 24) //add space to the right edge
                    }
                    .padding()
                }
            }
        }
    }
    
    func previousItemAction() {
        if (slideIndex > 0) {
            slideIndex -= 1;
        }
    }
    func nextItemAction() {
        if (slideIndex < slides.count-1) {
            slideIndex += 1;
        }
    }
}

struct SingleSlide: View {
    var name: String
    var body: some View {
        NavigationLink(destination: SoundView(environmentName: name)){
            VStack {
                Image(name) // Now uses image from Assets
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400) // Optional: adjust to your layout
                    .padding()
                Text(name)
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}



#Preview {
    NavigationSlides()
}
