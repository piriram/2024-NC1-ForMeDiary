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
