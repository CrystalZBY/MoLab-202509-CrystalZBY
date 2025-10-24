//
//  ItemRow.swift
//

import SwiftUI


struct ItemRow: View {
    var item:ItemModel
    
    @State var uiImage:UIImage?
    
    var body: some View {
        HStack {
            ZStack {
                if !item.assetName.isEmpty {
                    Image(item.assetName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height: 100)
                }
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height: 100)
                }
                if !item.systemName.isEmpty {
                    Image(systemName: item.systemName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height: 100)
                }
            }
            Text(item.label)
            Spacer()
        }
        .task {
            uiImage =  await imageFor(string: item.urlStr)
        }
    }
}


#Preview {
  ItemRow(item: ItemModel(label: "I am not a fish", systemName: "fish"))
    .environment(Document())
}
