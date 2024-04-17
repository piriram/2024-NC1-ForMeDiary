//
//  ListView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct AllListView: View {
    @EnvironmentObject var memoViewModel: MemoViewModel
    
    var body: some View {
        List {
            ForEach(groupedMemoHistory, id: \.0) { date, memos in
                Section(header: Text(formatSectionHeader(dateString: date))) {
                    ForEach(memos,id: \.self) { memo in
//                    ForEach(memos.sorted(by: { $0.time ?? "" > $1.time ?? "" }), id: \.self) { memo in
                        NavigationLink(destination: MemoUpdateView(memo: memo)) {
                            Text(memo.content)
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        deleteRow(at: indexSet)
//                        print("indexset:\(indexSet)")
                        writeToFile()
                    })
                }
            }
            
            
        }
        .onAppear(){
            ReadToFile()
            memoViewModel.memoHistory.sort(by: { $0.memo_date ?? "" > $1.memo_date ?? "" })
            
        }
    }
    
    func deleteRow(at offsets: IndexSet) {
        if let first = offsets.first{
            memoViewModel.memoHistory.remove(at: first)
        }
//        print(memoViewModel.memoHistory)
    }
    private var groupedMemoHistory: [(String, [MemoModel])] {
        let groupedMemos = Dictionary(grouping: memoViewModel.memoHistory) { memo in
            formatDate(dateString: memo.memo_date)
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
    func ReadToFile(){
        
        //파일매니저 인스턴스 생성
        let fileManager = FileManager.default
        
        //사용자의 문서 경로
        let documentPath: URL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        //파일을 저장할 디렉토리 경로(URL) 반환 = 경로 추가 여기서는 문서/새 폴더
        let directoryPath: URL = documentPath.appendingPathComponent(folderName)
        
        //
        let filePath: URL = directoryPath.appendingPathComponent(fileName)
        
        do {
            if !fileManager.fileExists(atPath: directoryPath.path) { //디렉토리가 있는지 확인하고 디렉토리를 만듬
                
                try fileManager.createDirectory(at: directoryPath, withIntermediateDirectories: false,attributes: nil)
                //withIntermediateDirectories:중간 디렉토리 만들꺼임?
                //attribute:파일접근 권한,그룹 등등 폴더 속성 정의
                
                print("폴더 만들었지롱")
                
            }
            else{
                //                print("폴더 already existed")
                print("filePath:\(filePath)")
            }
        } catch {
            print("create folder error. do something")
        }
        
        // 만들어진 폴더&파일 있는지 확인하고 없으면 만들기
        // 정상적으로 만들어졌으면 데이터 가져오기 or 데이터 넣기
        
        /* 데이터 가져오기 Process */
        // 폴더파일 존재가 true이면 디코딩
        // 환경변수를 뷰모델에서 관리해도 되나?
        
        
        if fileManager.fileExists(atPath: filePath.path) {
            do {
                
                // 파일에서 데이터를 읽어와 Data 객체로 변환
                let fileData = try Data(contentsOf: filePath)
                
                // 디코더 객체 생성
                let decoder = JSONDecoder()
                
                // 기존의 데이터와 중복을 없애기 위해 환경변수를 초기화
                memoViewModel.memoHistory = []
                
                // 디코딩된 메모 데이터를 MemoViewModel의 memoHistory에 추가
                memoViewModel.memoHistory = try decoder.decode([MemoModel].self, from: fileData)
                
                
            } catch {
                print("Failed to read and decode memo data:", error)
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
    AllListView()
}


