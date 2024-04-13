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
    
    var body: some View {
        VStack {
            
            VStack{
                HStack() {
                    Image(systemName: "lessthan")
                        .padding()
                    Spacer()
                    Image(systemName: "calendar")
                    
                    
                    Text("Today")
                        .font(Font.custom("Manrope", size: 18))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding()
                }
                .padding(.vertical,50)
                .frame(height: 60)
                .background(.white)
                .cornerRadius(20)
                .shadow(
                    color: Color(red: 0.11, green: 0.23, blue: 0.35, opacity: 0.05), radius: 20, y: 8
                )
            }.padding(.vertical,30)
            
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
