////
////  EmotionView.swift
////  NC1
////
////  Created by ram on 4/16/24.
////
//
//import SwiftUI
//
//struct OldEmotionView: View {
//    @Binding var emotion_num:Int
//    let emojis = ["피카츄", "파이리", "꼬북이", "이상해씨"]
//    @EnvironmentObject var memoViewModel : MemoViewModel
//    var body: some View {
//        HStack() {
//            ForEach(emojis.indices, id: \.self) { index in
//                Button(action: {
//                    self.emotion_num = index // emotion_num을 해당 emoji의 index로 설정
//                }) {
//                    
//                    if emotion_num == index {
//                        
//                        
//                        Image(self.emojis[index])
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 150)
////                            .padding()
//                    }
//                    else{
//                        Image(self.emojis[index])
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 100)
//                            .padding()
//                    }
//                }
//                
//            }
//        }
//    }
//}
