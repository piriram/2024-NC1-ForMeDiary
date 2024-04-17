//
//  CircleView.swift
//  NC1
//
//  Created by ram on 4/17/24.
//

import SwiftUI

struct CircleView: View {
    let radiusScale: CGFloat
    let text: String
    
    var body: some View {
        NavigationLink(destination: PartListView(emotion_num: Int(text) ?? static_num)){
            ZStack {
                Circle()
                    .foregroundColor(Color.blue.opacity(0.5))
                    .frame(width: 50 * radiusScale, height: 50 * radiusScale)
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.caption)
            }
        }
    }
}
