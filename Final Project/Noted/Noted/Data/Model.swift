//
//  Model.swift
//  Noted
//
//  Created by Crystal Zhang on 11/14/25.
//

// defines Model struct that stores and manages a list of items (ItemModel) --> data container or data manager
import SwiftUI

struct Model: Codable {
    // storing all items
    var items: [ItemModel]
    
    //initializes the model with an empty list of items
    init () {
        items = [];
    }
    
    //adding new items
    mutating func addItem(item: ItemModel) {
        items.append(item)
    }
    
    //update existing items
    mutating func updateItem(item: ItemModel) {
        if let index = findIndex(item.id) {
            items[index] = item;
        }
    }
    
    //delete items
    mutating func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    //help find the correct item by ID
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
    
}

//mutating: modifying struct properties (value types) requires making the function as mutating --> "this function will change (mutate) the struct's stored properties."
