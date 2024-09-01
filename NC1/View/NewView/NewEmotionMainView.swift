//
//  NewEmotionMainView.swift
//  NC1
//
//  Created by ram on 8/30/24.
//


import SwiftUI
import SwiftData

struct NewEmotionMainView: View {
    @Query private var memos: [MemoModel]
    @State private var emotionCounts: [String: Int] = [:]
    @EnvironmentObject var memo: MemoViewModel
    @Binding var shouldUpdate: Bool  // 업데이트 여부를 감시하는 바인딩 변수

    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(emotionCounts.sorted(by: { $0.value > $1.value }), id: \.key) { emotion, count in
                    NavigationLink(destination: NewPartListView(emotion_num: Int(emotion) ?? static_num)) {
                        ZStack {
                            if let idx = Int(emotion), idx < static_num {
                                Image(memo.emojis[idx])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .frame(height: 30 * CGFloat(count))
                            } else {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.white.opacity(0.1))
                                        .frame(height: 40 * CGFloat(count))
                                    Image(systemName: "questionmark")
                                        .frame(height: 20 * CGFloat(count))
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .onAppear {
            updateEmotionCounts()
        }
        .onChange(of: shouldUpdate) { _ in
            updateEmotionCounts()
        }
    }
    
    private func updateEmotionCounts() {
        var counts: [String: Int] = [:]
        for memo in memos {
            if let emotion = memo.emotion {
                counts[emotion, default: 0] += 1
            }
        }
        emotionCounts = counts
        print("emotionCounts: \(emotionCounts)")
    }
}
