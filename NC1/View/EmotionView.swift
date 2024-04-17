//
//  EmotionView.swift
//  NC1
//
//  Created by ram on 4/16/24.
//

import SwiftUI

struct EmotionView: View {
    @Binding var emotion_num:Int
    let emojis = ["face.smiling", "questionmark.circle", "exclamationmark.circle", "poweroutlet.type.f"]
    @EnvironmentObject var memoViewModel : MemoViewModel
    var body: some View {
        HStack(spacing: 10) {
            ForEach(emojis.indices, id: \.self) { index in
                Button(action: {
                    // 버튼이 눌렸을 때의 동작
//                    print("\(self.emojis[index])")
                    //                        memoViewModel.tmpMemo.emotion = self.emojis[index]+1
                    self.emotion_num = index // emotion_num을 해당 emoji의 index로 설정
                }) {
                    Image(systemName: self.emojis[index])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .clipShape(Circle())
                        .foregroundColor(emotion_num == index ? Color.blue : Color.black)
                }
            }
        }
    }
}
