//
//  CardEntity.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/13.
//

import SwiftUI

struct CardEntity: Hashable {
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
}

extension CardEntity {
    static let dummyData: [CardEntity] = [
        CardEntity(backgroundColor: .purple,
                   mainImage: "flag.fill",
                   sessionName: "유튭 라이브 버닝",
                   sessionTime: "8 PM - 10 PM"),
        CardEntity(backgroundColor: .red,
                   mainImage: "laptopcomputer",
                   sessionName: "영상 다시보기",
                   sessionTime: "8 AM - 9 AM"),
        CardEntity(backgroundColor: .yellow,
                   mainImage: "basket",
                   sessionName: "마트 장보기",
                   sessionTime: "10 AM - 11 AM"),
        CardEntity(backgroundColor: .blue,
                   mainImage: "tropicalstorm.circle",
                   sessionName: "당신은 바보입니까??",
                   sessionTime: "2 PM - 3 PM"),
        CardEntity(backgroundColor: .mint,
                   mainImage: "fork.knife.circle",
                   sessionName: "푸파 한판하기",
                   sessionTime: "4 PM - 5 PM"),
        CardEntity(backgroundColor: .green,
                   mainImage: "figure.australian.football",
                   sessionName: "피파 한판하기",
                   sessionTime: "2 PM - 3 PM"),
        CardEntity(backgroundColor: .red,
                   mainImage: "leaf.circle",
                   sessionName: "메이플 한판하기",
                   sessionTime: "2 PM - 3 PM")
    ]
}
