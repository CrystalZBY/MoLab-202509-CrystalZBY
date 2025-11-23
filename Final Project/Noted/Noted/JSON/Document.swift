////
////  Document.swift
////  Noted
////
////  Created by Crystal Zhang on 11/21/25.
////
//
//import Foundation
//
//@Observable
//class Document {
//    var model: Model
//    
//    // file name to store JSON for model items
//    let saveFileName = "model.json"
//    
//    // true to initialize model items with sample items
//    let initSampleItems = true
//    
//    init() {
//        print("Model init")
//        
//        // For testing:
//        // remove(fileName: saveFileName)
//        
//        model = Model(JSONfileName: saveFileName);
//        if initSampleItems && model.moodEntries.isEmpty {
//            // items for testing
//            model.moodEntries = []
//            saveModel();
//        }
//    }
//    
//    func addItem(urlStr:String, label:String, assetName:String, systemName: String) {
//        let item = ItemModel(id: UUID(), urlStr: urlStr, label: label, assetName: assetName, systemName: systemName);
//        model.addItem(item: item);
//    }
//    
//    func addItem(item: ItemModel) {
//        model.addItem(item: item);
//        saveModel();
//    }
//
//    func updateItem(item: ItemModel) {
//        model.updateItem(item: item);
//        saveModel();
//    }
//    
//    func deleteItem(id: UUID) {
//        model.deleteItem(id: id)
//        saveModel();
//    }
//    
//    func saveModel() {
//        print("Document saveModel")
//        model.saveAsJSON(fileName: saveFileName)
//    }
//}
