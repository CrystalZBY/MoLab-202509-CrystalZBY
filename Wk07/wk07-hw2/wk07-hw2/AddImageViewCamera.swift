import SwiftUI
import PhotosUI

struct AddImageViewCamera: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var image: Image?

    var body: some View {
        VStack(spacing: 20) {
            if let image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
            } else {
                Text("No image selected")
                    .foregroundStyle(.secondary)
            }

            // This picker can allow camera capture depending on configuration.
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                Label("Take or Choose Photo", systemImage: "camera")
            }
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        image = Image(uiImage: uiImage)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    AddImageViewCamera()
}
