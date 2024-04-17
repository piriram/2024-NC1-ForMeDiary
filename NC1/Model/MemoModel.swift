//
//  MemoModel.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import Foundation

struct MemoModel:Hashable, Identifiable ,Codable {
    var id = UUID()
    var memo_date: String?
    var emotion : String?
    var content: String
    
}

class MemoViewModel:ObservableObject{
    @Published var tmpMemo : MemoModel = MemoModel(content: "")
    @Published var memoHistory : [MemoModel] = []
    
    func filterMemosByEmotion(emotion: String) -> [MemoModel] {
            return memoHistory.filter { $0.emotion == emotion }
        }
    func countEmotionOccurrences() -> [String: Int] {
        var emotionCounts: [String: Int] = [:]
        for memo in memoHistory {
            if let emotion = memo.emotion {
                emotionCounts[emotion, default: 0] += 1
            }
        }
        return emotionCounts
    }
    
}
var fileName = "data1.txt"
var folderName = "NC1"
//        .ignoresSafeArea()
