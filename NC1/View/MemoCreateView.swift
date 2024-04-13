//
//  MemoContentView.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import SwiftUI

struct MemoCreateView: View {
    @State var content = ""
    @ObservedObject var MemoVM = MemoViewModel()
    var body: some View {
        VStack {
            TextEditor(text: $MemoVM.tmpMemo.content)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .padding(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(maxHeight:300)
            
            Button(action: {
                let currentDate = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let dateString = dateFormatter.string(from: currentDate)
                self.MemoVM.tmpMemo.time = dateString
                print(MemoVM.tmpMemo)
            }, label: {
                Text("Save")
                    .padding(.vertical,10)
                    .padding(.horizontal,50)
                    .font(Font.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.black)
                
            })
            
        }
        .padding()
        
        
        
    }
}

#Preview {
    MemoCreateView()
}
