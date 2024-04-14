//
//  ContentView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        @EnvironmentObject var memo : MemoViewModel
        NavigationView {
            VStack {
                ListView()
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
