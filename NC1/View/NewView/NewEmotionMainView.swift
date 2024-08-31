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
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(emotionCounts.sorted(by: { $0.value > $1.value }), id: \.key) { emotion, count in
                    OldCircleView(radiusScale: CGFloat(count), idx: Int(emotion) ?? static_num)
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .onAppear {
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
