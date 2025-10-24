//
//  Wk07_hwApp.swift
//  Wk07-hw
//
//  Created by Crystal Zhang on 10/17/25.
//

import SwiftUI

@main
struct Wk07_hwApp: App {
    @State var document = Document()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(document)
            
        }
    }
}
