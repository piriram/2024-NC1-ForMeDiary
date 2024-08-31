//
//  NewPartListView.swift
//  NC1
//
//  Created by ram on 8/30/24.
//
import SwiftUI
import SwiftData

struct NewPartListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var allMemos: [MemoModel]
    
    var emotion_num: Int
    @State private var groupedMemos: [(String, [MemoModel])] = []
    
    var body: some View {
        List {
            ForEach(groupedMemos, id: \.0) { date, memos in
                Section(header: Text(DateFormatterManager.shared.formatSectionHeader(dateString: date))) {
                    ForEach(memos) { memo in
                        NavigationLink(destination: NewMemoUpdateView(memo: memo)) {
                            Text(memo.content)
                        }
                    }
                    .onDelete { indices in
                        for index in indices {
                            let memo = memos[index]
                            modelContext.delete(memo)
                        }
                        do {
                            try modelContext.save()
                            updateGroupedMemos()
                        } catch {
                            print("Failed to save context after deletion: \(error)")
                        }
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .listStyle(.plain)
        .navigationTitle(Text("감정 기록"))
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityHidden(true)
        .onAppear {
            updateGroupedMemos()
        }
        .onChange(of: allMemos) { _, _ in
            updateGroupedMemos()
        }
    }
    
    private func updateGroupedMemos() {
        print("Debug: allMemos count - \(allMemos.count)") // 디버깅 출력 추가
        let filteredMemos = allMemos.filter { $0.emotion == String(emotion_num) }
        print("Debug: filteredMemos count - \(filteredMemos.count)") // 디버깅 출력 추가
        let sortedMemos = filteredMemos.sorted { ($0.memo_date ?? "") > ($1.memo_date ?? "") }
        
        let groupedDict = Dictionary(grouping: sortedMemos) { memo in
            DateFormatterManager.shared.formatFullDate(dateString: memo.memo_date)
        }
        groupedMemos = groupedDict.sorted { $0.key > $1.key }
        
        print("Debug: groupedMemos count - \(groupedMemos.count)") // 디버깅 출력 추가
        for (key, value) in groupedMemos {
            print("Debug: Section \(key) has \(value.count) memos") // 각 섹션의 메모 수 출력
        }
    }
}
