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
//                fileProcess()
                print("버튼 클릭")
                
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
    
    
    
}
#Preview {
    MemoDetailView(memo: MemoModel(content: "hello"))
}


