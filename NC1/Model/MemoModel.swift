//
//  MemoModel.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import Foundation

struct MemoModel: Hashable, Identifiable ,Codable {
    
    var id = UUID()
    var name: String
    var address: String
    var url: String
    var image: String

}
