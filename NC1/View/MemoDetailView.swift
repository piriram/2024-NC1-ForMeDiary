//
//  MemoDetailView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct MemoDetailView: View {

    @EnvironmentObject var memoViewModel: MemoViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var memo: MemoModel
    @State var showingAlert = false
    @State var editedMemo = ""
    
    
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


//
//[{"content":"아이디어\n고양이 자동 화장실 리뉴얼!!","id":"9E1356C7-D831-49BC-82E8-2C66FA78D668","time":"2024-04-15 16:29:29"},{"id":"433ABB80-2E9E-49D5-A152-F0A3C525A434","time":"2024-04-15 16:29:45","content":"쥬디한테 냄새남 킁카킁카"},{"content":"아침 챙겨오기 잊지말것🥸","time":"2024-04-16 09:31:12","id":"9F5C529A-3250-4C20-B651-861CC8E095AD"},{"id":"66EF0F97-65A7-48CD-9133-D130ADD5C92C","time":"2024-04-16 10:21:14","content":"나도 포항에서 짜장면 먹는다~~"},{"content":"ㅂㅜㅇㅔㅇㅔㅇㅔㅇㅔㅇㅔㅇ","id":"7FB4A600-8F1A-4668-93A1-3AD156A5D3A9","time":"2024-04-16 15:50:55"},{"id":"A59D8DE8-3DAE-4A48-8236-D5C384354D2A","time":"2024-04-16 16:02:11","content":"Dhk"},{"content":"zhzhzh","id":"05F53C60-EA6F-4049-8A79-8695F65BFF2B","time":"2024-04-16 16:03:44"}]
