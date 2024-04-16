//
//  ListDetailView.swift
//  NC1
//
//  Created by ram on 4/16/24.
//

import SwiftUI

struct ListDetailView: View {
    @State var content:String = ""
    @EnvironmentObject var memoViewModel : MemoViewModel
//    @StateObject var memoViewModel = MemoViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var showingAlert = false
    var body: some View {
        VStack(spacing:60) {
            CreateTopView()
//            EmotionView(emotion_num: emotion)

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
            print("hi")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("내용을 입력해주세요."), message: nil,
                  dismissButton: .default(Text("넹")))
        }
//        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

#Preview {
    ListDetailView()
}
