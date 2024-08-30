//
//  ListDetailView.swift
//  NC1
//
//  Created by ram on 4/16/24.
//

import SwiftUI

struct OldDetailCell: View {
    @State var content:String = ""
    @EnvironmentObject var memoViewModel : MemoViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var showingAlert = false
    @State var emotion_num = static_num
    var body: some View {
        VStack(spacing:60) {
            OldCurrentDateView(dateString: $memoViewModel.tmpMemo.memo_date)

            TextEditor(text: $memoViewModel.tmpMemo.content)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(maxHeight:300)

            Button(action: {
                //TODO: 함수로 묶기
                if memoViewModel.tmpMemo.content != ""{
                    
//                    saveData()
//                    writeToFile()
                    self.presentationMode.wrappedValue.dismiss()
                }
                else{
                    showingAlert = true
                }
                
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
        .onAppear(){
//            emotion_num=memoViewModel.
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("내용을 입력해주세요."), message: nil,
                  dismissButton: .default(Text("넹")))
        }
//        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

