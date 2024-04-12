//
//  MemoModel.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import Foundation

struct MemoModel: Hashable, Identifiable ,Codable {
    
    var id = UUID()
    var emotion: String
    var content: String
    var date: String

}
