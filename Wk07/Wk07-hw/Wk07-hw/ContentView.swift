import SwiftUI

struct ContentView: View {
    @Environment(Document.self) var document
    
    var body: some View {
        NavigationStack {
            List {
                // Display in reverse order to see new additions first
                ForEach(document.model.items.reversed()) { item in
                    NavigationLink( destination:
                        UpdateImageView(item: item)
                    )
                    {
                        ItemRow(item: item)
                    }
                }
            }
                .navigationTitle("State of Mind")
                .navigationBarItems(
                    trailing:
                        NavigationLink(destination:
                            AddImageView(item: ItemModel())
                        )
                    {
                        Text("Log Photo")
                    }
                )

//                Text("Take a deep breath. What are you feeling now?")
//                    .font(.title)
//                    .padding(.bottom, 15)
//
//                NavigationLink("Log") {
//                    MoodTrackerView()
//                }
//                .buttonStyle(.borderedProminent)
//                .font(.title)
            }
    }
}

#Preview {
  ContentView()
    .environment(Document())
}
