//
//  SwiftDataModel.swift
//  NC1
//
//  Created by ram on 7/13/24.
//

import Foundation
import SwiftData

@Model
final class SwiftDataModel{
//    var id = UUID()
    var memo_date: String? = nil
    var emotion : String? = nil
    var content: String = ""
    
    init(memo_date: String?, emotion: String?, content: String) {
        self.memo_date = memo_date
        self.emotion = emotion
        self.content = content
    }
    
    
}
