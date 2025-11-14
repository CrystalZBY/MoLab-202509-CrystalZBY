//
//  ModelJSON.swift
//  Noted
//
//  Created by Crystal Zhang on 11/14/25.
//

import SwiftUI

extension Model {
    
    func saveAsJSON(fileName: String) {
        do {
            try saveJSON(fileName: fileName, val: self);
        }
        catch {
            fatalError("Model saveAsJSON error \(error)")
        }
    }
    
    init(JSONfileName fileName: String) {
        items = []
        do {
            self = try loadJSON(Model.self, fileName: fileName)
        } catch {
            // fatalError("Model init error \(error)")
            print("Model init JSONfileName error \(error)")
        }
    }
}
