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
    @State private var showingAlert2 = false // "저장되었습니다" 알림을 위한 상태 변수
    @State private var emotion_num = static_num
    @Binding var shouldUpdate: Bool  // 업데이트 여부를 감시하는 바인딩 변수
    
    let emojis = ["피카츄", "파이리", "꼬북이", "이상해씨"]
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                Image(systemName: "calendar")
                Text("Today")
                    .font(Font.custom("Manrope", size: 18))
                    .foregroundColor(.black)
                Spacer()
            }
            .background(.white)
            .cornerRadius(20)
            
            HStack() {
                ForEach(emojis.indices, id: \.self) { index in
                    Button(action: {
                        self.emotion_num = index // emotion_num을 해당 emoji의 index로 설정
                    }) {
                        if emotion_num == index {
                            Image(self.emojis[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                        } else {
                            Image(self.emojis[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                                .padding()
                        }
                    }
                }
            }
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
                Text("저장")
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
        .alert(isPresented: $showingAlert2) {
            Alert(title: Text("저장되었습니다."), message: nil,
                  dismissButton: .default(Text("확인")))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveData() {
        if !content.isEmpty || emotion_num != static_num {
            let newMemo = MemoModel(
                memo_date: DateFormatterManager.shared.getCurrentDate(),
                emotion: String(emotion_num),
                content: content
            )
            modelContext.insert(newMemo)
            do {
                try modelContext.save()
                shouldUpdate = true // NewEmotionMainView에 업데이트 알림
                resetForm() // 폼 데이터 초기화
                showingAlert2 = true // "저장되었습니다" 알림 표시
            } catch {
                print("메모 저장 중 오류 발생: \(error)")
            }
        } else {
            showingAlert1 = true
        }
    }

    private func resetForm() {
        // 폼 데이터 초기화
        content = ""
        emotion_num = static_num
    }
    
    
}
