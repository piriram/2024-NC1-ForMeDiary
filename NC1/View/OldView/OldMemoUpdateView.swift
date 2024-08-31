////
////  MemoDetailView.swift
////  NC1
////
////  Created by ram on 4/14/24.
////
//
//import SwiftUI
//
//struct OldMemoUpdateView: View {
//    
//    @EnvironmentObject var memoViewModel: MemoViewModel
//    @Environment(\.presentationMode) var presentationMode
//    @State var memo: OldMemoModel
//    @State var showingAlert = false
//    @State var editedMemo = ""
//    @State var emotion_num = static_num
//    
//    var body: some View {
//        VStack() {
//            OldCurrentDateView(dateString: $memo.memo_date)
//            TextEditor(text: $editedMemo)
//                .lineSpacing(10)
//                .disableAutocorrection(true)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxHeight:300)
//                .padding(.vertical)
//            
//            OldEmotionView(emotion_num: $emotion_num)
//            Spacer()
//            
//            Button(action: {
//                memo.emotion=String(emotion_num)
//                print("memo.emotion:\(memo.emotion)")
//                memo.content=editedMemo
//                
//                if memo.content != ""{
//                    if let index = memoViewModel.memoHistory.firstIndex(where: { $0.id == memo.id }) {
//                        memoViewModel.memoHistory[index]=memo
//                    }
//                    memoViewModel.writeToFile()
//                    print("왜 안도ㅔㅐ")
//                    self.presentationMode.wrappedValue.dismiss()
//                }
//                else{
//                    showingAlert = true
//                }
//                print("버튼 클릭")
//                self.presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("Save")
//                    .padding(.vertical,10)
//                    .padding(.horizontal,50)
//                    .font(Font.system(size: 25, weight: .bold, design: .serif))
//                    .foregroundColor(.white)
//                    .background(RoundedRectangle(cornerRadius: 20))
//                    .foregroundColor(.black)
//            })
//        }
//        .onAppear(){
//            if let emotion = memo.emotion{
//                emotion_num = Int(emotion)!
//            }
//            
//            editedMemo = memo.content
//        }
//        .padding()
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("내용을 입력해주세요."), message: nil,
//                  dismissButton: .default(Text("넹")))
//        }
//        
//    }
//
//}
//
//
//
