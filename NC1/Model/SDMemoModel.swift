//
//  SDMemoModel.swift
//  NC1
//
//  Created by ram on 8/30/24.
//

import Foundation
import SwiftData

@Model
final class MemoModel{
    var memo_date: String?
    var emotion : String?
    var content: String = ""
    
    init(memo_date: String? = nil, emotion: String? = nil, content: String) {
        self.memo_date = memo_date
        self.emotion = emotion
        self.content = content
    }
}
