//
//  ContentView.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import SwiftUI
import UIKit

struct MemoContentView: View {
    @State var content = ""
    var body: some View {
        VStack {
           TextEditor(text: $content)
             .lineSpacing(10)
             .autocapitalization(.words)
             .disableAutocorrection(true)
             .padding()
                                
        }.overlay(
                 RoundedRectangle(cornerRadius: 25)
                   .stroke(Color.gray, lineWidth: 1)
                 )
        .padding()
    }
}

#Preview {
    MemoContentView()
}
