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
                PartListView()
                Spacer()
                NavigationLink(destination: MemoCreateView()) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
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
