////
////  ContentView.swift
////  NC1
////
////  Created by ram on 4/14/24.
////
//
//import SwiftUI
//
//struct OldRootView: View {
//    @EnvironmentObject var memo : MemoViewModel
//    @StateObject var memoViewModel = MemoViewModel()
//    var body: some View {
//        
//        NavigationView {
//            ZStack {
//                OldEmotionMainView()
//                VStack {
//                    
//                    HStack {
//                        Spacer()
//                        NavigationLink(destination: OldAllListView()){
//                            Text("See all")
//                                .padding()
//                        }
//                    }
//                    Spacer()
//                    
//                    Spacer()
//                    NavigationLink(destination: OldMemoCreateView()) {
//                        Image("마스터볼")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 80)
//                            .shadow(radius: 5)
////                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: -3, y: -3)
//
//                    }
//                    .padding()
//                }
//                
//            }
//            .navigationBarTitle("Emotional Diary")
//            
//            
//        }
//        
//        //
//        
//    }
//}
//
//#Preview {
//    OldRootView()
//}
