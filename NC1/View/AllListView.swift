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
            ForEach(memoViewModel.groupedMemoHistory, id: \.0) { date, memos in
                Section(header: Text(memoViewModel.formatSectionHeader(dateString: date))) {
                    ForEach(memos,id: \.self) { memo in
                        NavigationLink(destination: MemoUpdateView(memo: memo)) {
                            Text(memo.content)
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        memoViewModel.deleteRow(at: indexSet)
                        memoViewModel.writeToFile()
                    }
                    )
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .listStyle(.plain)
        .navigationTitle("모두 보기")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(){
            memoViewModel.ReadToFile()
            memoViewModel.memoHistory.sort(by: { $0.memo_date ?? "" > $1.memo_date ?? "" })
            
        }
    }
}


