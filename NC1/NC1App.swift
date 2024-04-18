//
//  NC1App.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import SwiftUI

@main
struct NC1App: App {
    @StateObject var memo = MemoViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(memo)
        
    }
}

