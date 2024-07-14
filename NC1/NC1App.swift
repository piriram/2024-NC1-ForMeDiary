//
//  NC1App.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import SwiftUI
import SwiftData

@main
struct NC1App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SwiftDataModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    @StateObject var memo = MemoViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            RootView()
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(memo)
        
    }
}

