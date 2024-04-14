//
//  MemoDetailView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct MemoDetailView: View {
    var memo: MemoModel
    
    
    var body: some View {
        VStack {
            Text(memo.content)
                .padding()
            Spacer()
            Button(action: {
                fileProcess()
                
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
        .navigationBarTitle("상세보기")
    }
    func fileProcess(){
        //파일매니저 인스턴스 생성
        let fileManager = FileManager.default
        //사용자의 문서 경로
        let documentPath: URL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //파일을 저장할 디렉토리 경로(URL) 반환 = 경로 추가 여기서는 문서/새 폴더
        let directoryPath: URL = documentPath.appendingPathComponent("abcdef")
        
        do {
            try fileManager.createDirectory(at: directoryPath, withIntermediateDirectories: false,attributes: nil)
            //withIntermediateDirectories:중간 디렉토리 만들꺼임?
            //attribute:파일접근 권한,그룹 등등 폴더 속성 정의
        } catch let e {
            print(e.localizedDescription)
        }
        print(directoryPath)
        //폴더에 파일 생성
        let textPath: URL = directoryPath.appendingPathComponent("hi.txt")
        // 아까 만든 'hi.txt' 경로에 텍스트 쓰기
        if let data: Data = "안녕하세요.".data(using: String.Encoding.utf8) { // String to Data
            do {
                try data.write(to: textPath) // 위 data를 "hi.txt"에 쓰기
            } catch let e {
                print(e.localizedDescription)
            }
        }
        // 만든 파일 불러와서 읽기.
        do {
            let dataFromPath: Data = try Data(contentsOf: textPath) // URL을 불러와서 Data타입으로 초기화
            let text: String = String(data: dataFromPath, encoding: .utf8) ?? "문서없음" // Data to String
            print(text) // 출력
        } catch let e {
            print(e.localizedDescription)
        }
//        // 파일을 삭제한다.
//        do {
//            try fileManager.removeItem(at: textPath)
//        } catch let e {
//            print(e.localizedDescription)
//        }
        // 삭제한걸 불러오려하면 오류가 남
//        do {
//            let dataFromPath: Data = try Data(contentsOf: textPath) // URL을 불러와서 Data타입으로 초기화
//            let text: String = String(data: dataFromPath, encoding: .utf8) ?? "문서없음" // Data to String
//            print(text) // 출력
//        } catch let e {
//            print(e.localizedDescription) // The file “hi.txt” couldn’t be opened because there is no such file.
//        }
    }
    
}
#Preview {
    MemoDetailView(memo: MemoModel(content: "hello"))
}


