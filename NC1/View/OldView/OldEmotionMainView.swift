//
//  MemoEmotionDistributionView.swift
//  NC1
//
//  Created by ram on 4/17/24.
//

import SwiftUI

struct OldEmotionMainView: View {
    @EnvironmentObject var memoViewModel: MemoViewModel
    @State private var emotionCounts: [String: Int] = [:]

    
    
    var body: some View {
         
        
        return VStack {
                Spacer()
                HStack {
                    ForEach(emotionCounts.sorted(by: { $0.value > $1.value }), id: \.key) { emotion, count in
                        
                        
                        OldCircleView(radiusScale: CGFloat(count), idx: Int(emotion) ?? static_num)
                        
                    }
                    
                }
                .padding(.horizontal)
                Spacer()
            }//
            .onAppear(){
                
                memoViewModel.ReadToFile()
                emotionCounts = memoViewModel.countEmotionOccurrences()
                print("emotionCounts:\(emotionCounts)")
                
                
            
        }
    }
    
}

#Preview {
    OldEmotionMainView()
}


