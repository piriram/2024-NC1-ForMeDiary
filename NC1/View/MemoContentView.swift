//
//  MemoContentView.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import SwiftUI

struct MemoContentView: View {
    @State var content = ""
    @ObservedObject var MemoVM = MemoViewModel()
    var body: some View {
        VStack {
            TextEditor(text: $MemoVM.tmpMemo.content)
             .lineSpacing(10)
             .disableAutocorrection(true)
             .padding()
             .overlay(
                      RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                      )
            
            Button(action: {}, label: {
                                Text("hi")
                                   .padding(10)
                                    .font(Font.system(size: 30, weight: .medium, design: .serif))
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 30))
                                    .foregroundColor(.init(red: 45 / 255, green: 0 / 255, blue: 112 / 255))

                            })
                                
        }
        .padding()
        
        
        
    }
}

#Preview {
    MemoContentView()
}
