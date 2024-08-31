//
//  NewCurrentDateView.swift
//  NC1
//
//  Created by ram on 8/31/24.
//
import SwiftUI

struct NewCurrentDateView: View {
    @Binding var dateString: String?
    @State var formattedDate: String?
        
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
        .onAppear {
            if let dateString = dateString {
                formattedDate = DateFormatterManager.shared.convertStringToDateAndFormat(
                    string: dateString,
                    fromFormat: "yyyy-MM-dd HH:mm:ss",
                    toFormat: "yyyy년 MM월 dd일"
                )
            }
        }
    }
}
