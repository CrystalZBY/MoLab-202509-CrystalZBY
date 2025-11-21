//
//  AddEntryFlowView.swift
//  Noted
//
//  Created by Crystal Zhang on 11/21/25.
//

import SwiftUI

struct AddEntryFlowView: View {
    @Binding var isPresented: Bool
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            LifeAreaSelectView()
                .navigationTitle("Select Area")
                .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
}

