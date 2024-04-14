//
//  MemoContentView.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import SwiftUI

struct MemoCreateView: View {
    @State var content = ""
    @EnvironmentObject var memoViewModel : MemoViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var showingAlert = false
    let emojis = ["face.smiling", "questionmark.circle", "exclamationmark.circle", "poweroutlet.type.f"]
    
    var body: some View {
        VStack() {
            
            CreateTopView()
            Spacer()
            HStack(spacing: 10) {
                ForEach(emojis, id: \.self) { emoji in
                    
                    Button(action: {
                        // 버튼이 눌렸을 때의 동작을 구현합니다.
                        print("\(emoji)")
                        memoViewModel.tmpMemo.emotion = emoji
                    }) {
                        Image(systemName: emoji)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding() // 이미지 간 간격 조절
                            .clipShape(Circle()) // 버튼 모양을 원 모양으로 지정
                            .foregroundColor(memoViewModel.tmpMemo.emotion == emoji ? Color.blue : Color.black)
                    }
                }
            }
         
            TextEditor(text: $memoViewModel.tmpMemo.content)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .padding(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(maxHeight:300)
            Spacer()
            Spacer()
            Button(action: {
                //TODO: 함수로 묶기
                if memoViewModel.tmpMemo.content != ""{
                    saveData()
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
        
        
        
    }
    func saveData(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: currentDate)
        self.memoViewModel.tmpMemo.time = dateString
        print(memoViewModel.tmpMemo)
        memoViewModel.memoHistory.append(memoViewModel.tmpMemo)
        memoViewModel.tmpMemo = MemoModel(content: "")
    }
}

#Preview {
    MemoCreateView()
}
