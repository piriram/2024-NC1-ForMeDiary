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
                Circle()
                    .foregroundColor(Color.blue.opacity(0.5))
                    .frame(width: 50 * radiusScale, height: 50 * radiusScale)
                
                Text(memo.emojis[idx])
                    .foregroundColor(.white)
                    .font(.caption)
            }
        }
    }
}
