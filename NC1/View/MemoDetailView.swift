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
        }
        .navigationBarTitle("상세보기")
    }
}


