//
//  NewCircleView.swift
//  NC1
//
//  Created by ram on 8/31/24.
//

import SwiftUI

struct NewCircleView: View {
    let radiusScale: CGFloat
    let idx: Int
    @EnvironmentObject var memo:MemoViewModel
    
    var body: some View {
        NavigationLink(destination: NewPartListView(emotion_num: idx)){
            ZStack {
                if idx<static_num{
                    Image(memo.emojis[idx])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white.opacity(0.5))
                        .frame(height: 30 * radiusScale)
                }
                else{
                    ZStack{
                        Circle()
                            .foregroundColor(Color.white.opacity(0.1))
                            .frame(height: 40 * radiusScale)
                        Image(systemName: "questionmark")
                            .frame(height: 20 * radiusScale)
                    }
                }

            }
        }
    }
}