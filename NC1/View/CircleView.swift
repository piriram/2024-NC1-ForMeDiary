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
