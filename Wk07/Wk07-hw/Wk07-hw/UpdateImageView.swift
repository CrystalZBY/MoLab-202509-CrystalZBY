import SwiftUI

struct UpdateImageView: View {
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
                Button("Update") {
                    print("UpdateImageView Update")
                    document.updateItem(item: item)
                    dismiss()
                }
                Spacer()
                Button("Delete") {
                    document.deleteItem(id: item.id)
                    dismiss();
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

struct UpdateImageView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateImageView(item: ItemModel())
        .environment(Document())

    }
}
