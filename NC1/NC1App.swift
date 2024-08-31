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
    // SwiftData를 사용하기 위한 환경 설정
    @StateObject var memo = MemoViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(memo)
                .modelContainer(for: [MemoModel.self]) // 모델 컨테이너 설정
        }
    }
}
