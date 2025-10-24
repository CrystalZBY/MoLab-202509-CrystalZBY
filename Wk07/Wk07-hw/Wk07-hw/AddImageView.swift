//
//  AddImageView.swift
//

import SwiftUI

// AddImageView is very similar to UpdateImageView
// consider refactoring into single View with property vars
// for the differences
//  Button Add/Cancel
//  Button Update/Delete
//
struct AddImageView: View {
    @State var item: ItemModel
    
    @State var uiImage:UIImage?
    
    @Environment(\.dismiss) var dismiss
  @Environment(Document.self) var document

    var body: some View {
        VStack {
            ZStack {
                if !item.assetName.isEmpty {
                    Image(item.assetName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                if !item.systemName.isEmpty {
                    Image(systemName: item.systemName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            HStack {
                Button("Add") {
                    print("AddImageView Add")
                    document.addItem(item: item)
                    dismiss()
                }
                Spacer()
                Button("Cancel") {
                    print("AddImageView Cancel")
                    dismiss()
                }
            }.padding(10)
            Form {
                TextField("url", text: $item.urlStr)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("label", text: $item.label)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("assetName", text: $item.assetName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("systemName", text: $item.systemName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
        }
        .task {
            uiImage =  await imageFor(string: item.urlStr)
        }
    }
}

#Preview {
  AddImageView(item: ItemModel())
    .environment(Document())
}
