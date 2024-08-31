//
//  NewAllListView.swift
//  NC1
//
//  Created by ram on 8/31/24.
//
import SwiftUI
import SwiftData

struct NewAllListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var memoHistory: [MemoModel]
    
    var body: some View {
        List {
            ForEach(groupedMemoHistory, id: \.0) { date, memos in
                Section(header: Text(formatSectionHeader(dateString: date))) {
                    ForEach(memos, id: \.self) { memo in
                        NavigationLink(destination: NewMemoUpdateView(memo: memo)) {
                            Text(memo.content)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteRow(at: indexSet, in: memos)
                        saveData()
                    })
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .listStyle(.plain)
        .navigationTitle("모두 보기")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var groupedMemoHistory: [(String, [MemoModel])] {
        Dictionary(grouping: memoHistory) { memo in
            memo.memo_date?.components(separatedBy: " ").first ?? "Unknown Date"
        }
        .map { ($0.key, $0.value) }
        .sorted { $0.0 > $1.0 }
    }
    
    private func formatSectionHeader(dateString: String) -> String {
        DateFormatterManager.shared.formatSectionHeader(dateString: dateString)
    }
    
    private func deleteRow(at offsets: IndexSet, in memos: [MemoModel]) {
        for index in offsets {
            let memo = memos[index]
            modelContext.delete(memo)
        }
    }
    
    private func saveData() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
