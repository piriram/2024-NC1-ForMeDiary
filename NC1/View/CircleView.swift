//
//  CircleView.swift
//  NC1
//
//  Created by ram on 4/17/24.
//

import SwiftUI

struct CircleView: View {
    let radiusScale: CGFloat
    let idx: Int
    @EnvironmentObject var memo:MemoViewModel
    
    var body: some View {
        NavigationLink(destination: PartListView(emotion_num: idx)){
            ZStack {
                Image(memo.emojis[idx])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue.opacity(0.5))
                    .frame(height: 40 * radiusScale)
//
//                Text(memo.emojis[idx])
//                    .foregroundColor(.white)
//                    .font(.caption)
            }
        }
    }
}
