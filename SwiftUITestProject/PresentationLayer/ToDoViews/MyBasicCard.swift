//
//  MyBasicCard.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/13.
//

import SwiftUI

struct MyBasicCard: View {
    var backgroundColor: Color
    var mainImage: String
    var sessionName: String
    var sessionTime: String
    
    init(backgroundColor: Color,
         mainImage: String,
         sessionName: String,
         sessionTime: String) {
        self.backgroundColor = backgroundColor
        self.mainImage = mainImage
        self.sessionName = sessionName
        self.sessionTime = sessionTime
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: mainImage)
                .font(.system(size: 40))
                .foregroundColor(.white)
                
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                
                Text(sessionName)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Spacer().frame(height: 5)
                
                Text(sessionTime)
                    .foregroundColor(Color.white)
            }
            
            
        }
        .padding(20)
        .background(backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard(backgroundColor: .purple,
                    mainImage: "flag.fill",
                    sessionName: "유튭 라이브 버닝",
                    sessionTime: "8AM - 10AM")
    }
}
