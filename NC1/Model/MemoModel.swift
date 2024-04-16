//
//  MemoModel.swift
//  NC1
//
//  Created by ram on 4/12/24.
//

import Foundation

struct MemoModel:Hashable, Identifiable ,Codable {
    
    var id = UUID()
    var time: String?
    var emotion : String?
    var content: String
    
   

    
}

class MemoViewModel:ObservableObject{
    @Published var tmpMemo : MemoModel = MemoModel(content: "")
    @Published var memoHistory : [MemoModel] = []
    
    
}
var fileName = "data1.txt"
var folderName = "NC1"
//        .ignoresSafeArea()
