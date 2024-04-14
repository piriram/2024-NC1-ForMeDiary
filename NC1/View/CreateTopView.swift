//
//  CreateTopView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct CreateTopView: View {
    var body: some View {
        
        HStack() {
            Image(systemName: "lessthan")
                .padding()
            Spacer()
            Image(systemName: "calendar")
            Text("Today")
                .font(Font.custom("Manrope", size: 18))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "greaterthan")
                .padding()
        }
        .frame(height: 60)
        .background(.white)
        .cornerRadius(20)
        //            .shadow(
        //                color: Color(red: 0.11, green: 0.23, blue: 0.35, opacity: 0.05), radius: 20, y: 8
        //            )
        
    }
}

#Preview {
    CreateTopView()
}
