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
    @State private var isActive: Bool = false // 버튼이 활성화되었는지 여부를 나타내는 상태 변수
    
    var body: some View {
        ZStack {
            NavigationLink(destination: PartListView(emotion_num: Int(text) ?? static_num), isActive: $isActive) {
                EmptyView()
            }
            .hidden() // NavigationLink를 숨김
            
            Button(action: {
                isActive = true // 버튼이 클릭되면 isActive를 true로 설정하여 NavigationLink를 활성화
            }) {
                Circle()
                    .foregroundColor(Color.blue.opacity(0.5))
                    .frame(width: 50 * radiusScale, height: 50 * radiusScale)
            }
            
            Text(text)
                .foregroundColor(.white)
                .font(.caption)
        }
    }
}
#Preview {
    CircleView()
}
