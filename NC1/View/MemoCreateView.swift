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
//            Spacer()
            VStack{
                HStack(spacing: 16) {
                    Image(systemName: "lessthan")
                    Image(systemName: "calendar")
                    
                    Text("Today")
                        .font(Font.custom("Manrope", size: 18))
                        .foregroundColor(.black)
                    
                    Image(systemName: "greaterthan")
                }
                .padding(.vertical,50)
                .frame(width: 328, height: 57)
                .background(.white)
                .cornerRadius(8)
                .shadow(
                    color: Color(red: 0.11, green: 0.23, blue: 0.35, opacity: 0.05), radius: 20, y: 8
                )
            }.padding(.vertical,30)
            
            TextEditor(text: $MemoVM.tmpMemo.content)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .padding(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(maxHeight:300)
            Spacer()
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
