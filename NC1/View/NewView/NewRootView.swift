//
//  NewRootView.swift
//  NC1
//
//  Created by ram on 8/30/24.
//


import SwiftUI
import SwiftData

struct NewRootView: View {
    @EnvironmentObject var memo : MemoViewModel
    @StateObject var memoViewModel = MemoViewModel()
    @Environment(\.modelContext) var modelContext:ModelContext
    var body: some View {
        
        NavigationView {
            ZStack {
                NewEmotionMainView()
                VStack {
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: OldAllListView()){
                            Text("See all")
                                .padding()
                        }
                    }
                    Spacer()
                    
                    Spacer()
                    NavigationLink(destination: NewMemoCreateView()) {
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

#Preview {
    OldRootView()
}

