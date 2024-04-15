//
//  ListView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var memoViewModel: MemoViewModel
    
    var body: some View {
        
        List {
            ForEach(groupedMemoHistory, id: \.0) { date, memos in
                Section(header: Text(formatSectionHeader(dateString: date))) {
                    ForEach(memos, id: \.id) { memo in
                        NavigationLink(destination: MemoDetailView(memo: memo)) {
                            Text(memo.content)
                        }
                    }
                }
            }
        }
//        .padding(.vertical,200)
//        .ignoresSafeArea()
        .onAppear(){
            ReadToFile()
        }
        
    }
    
    
    private var groupedMemoHistory: [(String, [MemoModel])] {
        let groupedMemos = Dictionary(grouping: memoViewModel.memoHistory) { memo in
            formatDate(dateString: memo.time)
        }
        return groupedMemos.sorted(by: { $0.key > $1.key })
    }
    
    private func formatDate(dateString: String?) -> String {
        guard let dateString = dateString else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date ?? Date())
    }
    
    func ReadToFile(){
        //파일매니저 인스턴스 생성
        let fileManager = FileManager.default
        //사용자의 문서 경로
        let documentPath: URL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //파일을 저장할 디렉토리 경로(URL) 반환 = 경로 추가 여기서는 문서/새 폴더
        let directoryPath: URL = documentPath.appendingPathComponent(folderName)
        
        let textPath: URL = directoryPath.appendingPathComponent(fileName)
        do {
            if !fileManager.fileExists(atPath: directoryPath.path) { //디렉토리가 있는지 확인하고 디렉토리를 만듬
                try fileManager.createDirectory(at: directoryPath, withIntermediateDirectories: false,attributes: nil)
                //withIntermediateDirectories:중간 디렉토리 만들꺼임?
                //attribute:파일접근 권한,그룹 등등 폴더 속성 정의
                
                print("폴더 만들었지롱")
                
                
            }
            else{
                print("폴더 존재했음")
            }
        } catch {
            print("create folder error. do something")
        }
        
        
        do{
            if fileManager.fileExists(atPath: textPath.path) {
                do {
                    let fileData = try Data(contentsOf: textPath)
                    let decoder = JSONDecoder()
                    let decodedMemo = try decoder.decode([MemoModel].self, from: fileData)
                    // 디코딩된 메모 데이터를 MemoViewModel의 memoHistory에 추가
                    memoViewModel.memoHistory = []
                    decodedMemo.forEach { memoViewModel.addMemo($0) }
                    print("Memo History: \(memoViewModel.memoHistory)")
                } catch {
                    print("Failed to read and decode memo data:", error)
                }
            }
        }
        
    }
    private func formatSectionHeader(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString) ?? Date()
        let today = Calendar.current.startOfDay(for: Date())
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        if Calendar.current.isDate(date, inSameDayAs: today) {
            return "Today"
        } else if Calendar.current.isDate(date, inSameDayAs: yesterday) {
            return "Yesterday"
        } else {
            return dateString
        }
    }
}



#Preview {
    ListView()
}


