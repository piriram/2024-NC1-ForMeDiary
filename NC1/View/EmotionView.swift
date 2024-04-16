//
//  EmotionView.swift
//  NC1
//
//  Created by ram on 4/16/24.
//

import SwiftUI

struct EmotionView: View {
    let emojis = ["face.smiling", "questionmark.circle", "exclamationmark.circle", "poweroutlet.type.f"]
    @EnvironmentObject var memoViewModel : MemoViewModel
    var body: some View {
        
        
        HStack(spacing: 10) {
            ForEach(emojis, id: \.self) { emoji in
                
                Button(action: {
                    // 버튼이 눌렸을 때의 동작
                    print("\(emoji)")
                    memoViewModel.tmpMemo.emotion = emoji
                }) {
                    Image(systemName: emoji)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .clipShape(Circle())
                        .foregroundColor(memoViewModel.tmpMemo.emotion == emoji ? Color.blue : Color.black)
                }
            }
        }
    }
}

#Preview {
    EmotionView()
}
