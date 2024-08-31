////
////  ListView.swift
////  NC1
////
////  Created by ram on 4/14/24.
////
//
//import SwiftUI
//
//struct OldPartListView: View {
//    @EnvironmentObject var memoViewModel: MemoViewModel
//    @State var lll:[OldMemoModel] = []
//    var emotion_num = static_num
//    @State var ttt : [(String, [OldMemoModel])] = []
//   
//    
//    var body: some View {
//        List {
//            ForEach(ttt, id: \.0) { date, memos in
//                Section(header: Text(formatSectionHeader(dateString: date))) {
//                    ForEach(memos) { memo in
//                        NavigationLink(destination: OldMemoUpdateView(memo: memo)) {
//                            Text(memo.content)
////                            Text("id:\(memo.id)")
//                        }
//                    }
//                    .onDelete { indices in
//                        // 삭제할 요소의 인덱스를 사용하여 실제로 요소를 삭제
//                        for index in indices {
//                            let memo = memos[index] // 삭제할 메모
////                            print("Deleted memo ID: \(memo.id)")
////                            print("Deleted memo content: \(memo.content)")
//                            
//                            // memoViewModel.memoHistory에서 해당 메모를 삭제
//                            if let memoIndex = memoViewModel.memoHistory.firstIndex(where: { $0.id == memo.id }) {
//                                memoViewModel.memoHistory.remove(at: memoIndex)
//                            }
//                        }
//                        
//                        // 파일에 쓰기
//                        memoViewModel.writeToFile()
//                        
//                        // 필요한 경우 다시 필터링 및 정렬
//                        lll = memoViewModel.filterMemosByEmotion(emotion: String(emotion_num))
//                        lll.sort(by: { $0.memo_date ?? "" > $1.memo_date ?? "" })
//                        ttt = groupedMemoHistory
//                    }
//                }
//            }
//        }
//        .scrollDismissesKeyboard(.interactively)
//        .listStyle(.plain)
//        .navigationTitle(Text("감정 기록"))
//        .navigationBarTitleDisplayMode(.inline)
//        .accessibilityHidden(true)
//        .onAppear(){
//            lll=memoViewModel.filterMemosByEmotion(emotion: String(emotion_num))
//            lll.sort(by: { $0.memo_date ?? "" > $1.memo_date ?? "" })
//            ttt = groupedMemoHistory
////            print("lll:\(lll)")
//            print("emotion_num:\(emotion_num)")
//            
//        }
//    }
//    
//    func deleteRow(at offsets: IndexSet) {
//        if let first = offsets.first{
//            memoViewModel.memoHistory.remove(at: first)
//        }
//    }
//    private var groupedMemoHistory: [(String, [OldMemoModel])] {
//        let groupedMemos = Dictionary(grouping: lll) { memo in
//            formatDate(dateString: memo.memo_date)
//        }
//        return groupedMemos.sorted(by: { $0.key > $1.key })
//    }
//    
//    private func formatDate(dateString: String?) -> String {
//        guard let dateString = dateString else { return "" }
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let date = dateFormatter.date(from: dateString)
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        return dateFormatter.string(from: date ?? Date())
//    }
//    private func formatSectionHeader(dateString: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let date = dateFormatter.date(from: dateString) ?? Date()
//        let today = Calendar.current.startOfDay(for: Date())
//        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
//        if Calendar.current.isDate(date, inSameDayAs: today) {
//            return "Today"
//        } else if Calendar.current.isDate(date, inSameDayAs: yesterday) {
//            return "Yesterday"
//        } else {
//            return dateString
//        }
//    }
//}
//
//
//
