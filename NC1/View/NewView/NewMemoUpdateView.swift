//
//  NewMemoUpdateView.swift
//  NC1
//
//  Created by ram on 8/31/24.
//

import SwiftUI
import SwiftData

struct NewMemoUpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var memo: MemoModel
    @State private var showingAlert = false
    @State private var editedMemo = ""
    @State private var emotion_num = static_num
    
    var body: some View {
        VStack {
            OldCurrentDateView(dateString: $memo.memo_date)
            TextEditor(text: $editedMemo)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(maxHeight: 300)
                .padding(.vertical)
            
            OldEmotionView(emotion_num: $emotion_num)
            Spacer()
            
            Button(action: {
                memo.emotion = String(emotion_num)
                memo.content = editedMemo
                
                if !memo.content.isEmpty {
                    do {
                        try modelContext.save()
                        dismiss()
                    } catch {
                        print("Failed to save memo: \(error)")
                    }
                } else {
                    showingAlert = true
                }
            }, label: {
                Text("Save")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .font(Font.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.black)
            })
        }
        .onAppear {
            if let emotion = memo.emotion {
                emotion_num = Int(emotion) ?? static_num
            }
            editedMemo = memo.content
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("내용을 입력해주세요."), message: nil,
                  dismissButton: .default(Text("넹")))
        }
    }
}
