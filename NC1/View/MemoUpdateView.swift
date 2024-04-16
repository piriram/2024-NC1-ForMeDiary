//
//  MemoDetailView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct MemoUpdateView: View {

    @EnvironmentObject var memoViewModel: MemoViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var memo: MemoModel
    @State var showingAlert = false
    @State var editedMemo = ""
    @State var emotion_num = static_num
    
    var body: some View {
        VStack(spacing:60) {
            
            TextEditor(text: $editedMemo)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(maxHeight:300)
            EmotionView(emotion_num: $emotion_num)
            Spacer()
            
            Button(action: {
                memo.content=editedMemo
                if memo.content != ""{
                    
                    saveData()
                    writeToFile()
                    self.presentationMode.wrappedValue.dismiss()
                }
                else{
                    showingAlert = true
                }
                // Save edited content
                
                writeToFile()
                print("버튼 클릭")
                self.presentationMode.wrappedValue.dismiss()
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
        .onAppear(){
            if let emotion = memo.emotion{
                emotion_num = Int(emotion)!
            }
            
            editedMemo = memo.content
        }
        .padding()
        .navigationBarTitle("상세보기")
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("내용을 입력해주세요."), message: nil,
                  dismissButton: .default(Text("넹")))
        }
        
    }
    func saveData(){
        memo.emotion = String(emotion_num)
        if let index = memoViewModel.memoHistory.firstIndex(where: { $0.id == memo.id }) {
            memoViewModel.memoHistory[index] = memo
            print("너가찾은애들:\(memoViewModel.memoHistory[index])")
        }
        else{
            print("어라")
        }
    }
    func writeToFile() {
        // 파일매니저 인스턴스 생성
        let fileManager = FileManager.default
        // 사용자의 문서 경로
        let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // 파일을 저장할 디렉토리 경로(URL) 반환 = 경로 추가 여기서는 문서/새 폴더
        let directoryPath = documentPath.appendingPathComponent(folderName)
        
        print(documentPath.path)
        // 폴더에 파일 생성
        let textPath = directoryPath.appendingPathComponent(fileName)
        
        // JSONEncoder를 사용하여 memoViewModel.tmpMemo를 JSON으로 인코딩
        let encoder = JSONEncoder()
        do {
            let memoData = try encoder.encode(memoViewModel.memoHistory)
            // 파일에 데이터를 쓰기
            try memoData.write(to: textPath)
            print("Memo data saved to: \(textPath)")
        } catch {
            print("Failed to save memo data:", error)
        }
        
        
    }
}



