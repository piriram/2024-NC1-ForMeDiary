//
//  NewMemoCreateView.swift
//  NC1
//
//  Created by ram on 8/30/24.
//

import SwiftUI
import SwiftData

var static_num = 5

struct NewMemoCreateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var content: String = ""
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var emotion_num = static_num
    
    var body: some View {
        VStack {
            OldCurrentDateView(dateString: .constant(getCurrentDate()))
            OldEmotionView(emotion_num: $emotion_num)
                .frame(height: 120)
                .padding(.vertical)
            
            TextEditor(text: $content)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.vertical)
            
            Button(action: saveData) {
                Text("Save")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .font(Font.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.black)
            }
        }
        .padding()
        .alert(isPresented: $showingAlert1) {
            Alert(title: Text("내용을 입력해주세요."), message: nil,
                  dismissButton: .default(Text("넹")))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveData() {
        if !content.isEmpty || emotion_num != static_num {
            let newMemo = MemoModel(
                memo_date: getCurrentDate(),
                emotion: String(emotion_num),
                content: content
            )
            modelContext.insert(newMemo)
            do {
                try modelContext.save()
                dismiss()
            } catch {
                print("메모 저장 중 오류 발생: \(error)")
            }
        } else {
            showingAlert1 = true
        }
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}


