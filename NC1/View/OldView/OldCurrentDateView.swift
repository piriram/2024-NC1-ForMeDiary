//
//  CreateTopView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct OldCurrentDateView: View {
    @Binding var dateString: String?
    @State var formattedDate:String?
        
    var body: some View {
        
        HStack(alignment: .top) {
            
            Spacer()
            Image(systemName: "calendar")
            Text(formattedDate ?? "Today") // 받은 날짜 문자열로 Text 설정
                .font(Font.custom("Manrope", size: 18))
                .foregroundColor(.black)
            Spacer()
            
        }
        .background(.white)
        .cornerRadius(20)
        .onAppear{
            if let dateString = dateString{
                formattedDate = convertStringToDateAndFormat(string: dateString, fromFormat: "yyyy-MM-dd HH:mm:ss", toFormat: "yyyy년 MM월 dd일")
            }
            
            
            
        }
        
        
        
    }
        
        
    func convertStringToDateAndFormat(string: String, fromFormat: String, toFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        
        guard let date = dateFormatter.date(from: string) else {
            // 문자열을 날짜로 변환하는 데 실패하면 nil 반환
            return nil
        }
        
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
}

