//
//  ContentView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var memo : MemoViewModel
    @StateObject var memoViewModel = MemoViewModel()
    var body: some View {
        
        NavigationView {
            VStack {
                AllListView()
                Spacer()
                NavigationLink(destination: MemoCreateView()) {
                    Image("마스터볼")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
            }
            .navigationBarTitle("Memo List")
            
            
        }
//        
    
    }
}

#Preview {
    RootView()
}
