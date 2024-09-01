//
//  NewRootView.swift
//  NC1
//
//  Created by ram on 8/30/24.
//


import SwiftUI
import SwiftData

struct HomeView: View {
    @EnvironmentObject var memo : MemoViewModel
    @StateObject var memoViewModel = MemoViewModel()
    @Environment(\.modelContext) var modelContext:ModelContext
    @State private var shouldUpdate: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NewEmotionMainView(shouldUpdate: $shouldUpdate)
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: NewAllListView()){
                            Text("모두 보기")
                                .padding()
                        }
                    }
                    Spacer()
                    Spacer()
                    NavigationLink(destination: NewMemoCreateView(shouldUpdate: $shouldUpdate)) {
                        Image("마스터볼")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                            .shadow(radius: 5)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Emotional Diary")
   
        }
        .onAppear(){
            print(modelContext.sqliteCommand)
            print("----------")
        }
    }
}
