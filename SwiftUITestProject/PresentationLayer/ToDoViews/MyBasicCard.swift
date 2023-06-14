//
//  MyBasicCard.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/13.
//

import SwiftUI

struct MyBasicCard: View {
    let cardEntity: CardEntity
    
    init(cardEntity: CardEntity) {
        self.cardEntity = cardEntity
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: cardEntity.mainImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                
                Text(cardEntity.sessionName)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Spacer().frame(height: 5)
                
                Text(cardEntity.sessionTime)
                    .foregroundColor(Color.white)
            }
            
            
        }
        .padding(20)
        .background(cardEntity.backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard(cardEntity: CardEntity.dummyData[0])
    }
}
