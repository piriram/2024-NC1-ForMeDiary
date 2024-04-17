//
//  CreateTopView.swift
//  NC1
//
//  Created by ram on 4/14/24.
//

import SwiftUI

struct CurrentDateView: View {
    
    var body: some View {
        
        HStack(alignment: .top) {

            Spacer()
            Image(systemName: "calendar")
            Text("Today")
                .font(Font.custom("Manrope", size: 18))
                .foregroundColor(.black)
            Spacer()

        }
        .background(.white)
        .cornerRadius(20)

        
    }
}

#Preview {
    CurrentDateView()
}
