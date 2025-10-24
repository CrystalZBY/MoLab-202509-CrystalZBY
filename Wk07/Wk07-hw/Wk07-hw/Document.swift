import Foundation

@Observable
class Document {
    var model: Model
    
    // file name to store JSON for model items
    let saveFileName = "model.json"
    
    // true to initialize model items with sample items
    let initSampleItems = true
    
    init() {
        print("Model init")
        
        // For testing:
        // remove(fileName: saveFileName)
        
        model = Model(JSONfileName: saveFileName);
        if initSampleItems && model.items.isEmpty {
            // items for testing
            model.items = []
            addItem(urlStr: imageArray[2], label:"jht1", assetName: "red", systemName: "dog");
            addItem(urlStr: imageArray[1], label:"ari", assetName: "yellow", systemName: "circle");
            addItem(urlStr: imageArray[0], label:"dan", assetName: "", systemName: "rectangle");
            saveModel();
        }
    }
    
    func addItem(urlStr:String, label:String, assetName:String, systemName: String) {
        let item = ItemModel(id: UUID(), urlStr: urlStr, label: label, assetName: assetName, systemName: systemName);
        model.addItem(item: item);
    }
    
    func addItem(item: ItemModel) {
        model.addItem(item: item);
        saveModel();
    }

    func updateItem(item: ItemModel) {
        model.updateItem(item: item);
        saveModel();
    }
    
    func deleteItem(id: UUID) {
        model.deleteItem(id: id)
        saveModel();
    }
    
    func saveModel() {
        print("Document saveModel")
        model.saveAsJSON(fileName: saveFileName)
    }
}

// Array of image url strings
let imageArray = [
    "https://i.pinimg.com/736x/5f/d6/76/5fd6765b727307a657fff1825aeece65.jpg",
    "https://i.pinimg.com/1200x/c7/71/b2/c771b25650836a9eac75d3ac52cfec58.jpg",
    "https://i.pinimg.com/736x/19/bd/c6/19bdc69ec930a4a00bbf33e045b6a7c9.jpg",
    "https://i.pinimg.com/736x/3f/f1/8b/3ff18baa806d819794a7ddad78e6da95.jpg",
    "https://i.pinimg.com/736x/6c/90/b4/6c90b4e00aa361673902b123bffc9150.jpg",
    "https://i.pinimg.com/736x/11/44/3b/11443bba87827e0c7fcf6a17eed66aae.jpg",
]
