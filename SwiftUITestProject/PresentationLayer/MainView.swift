//
//  MainView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    MyProjectCard()
                    MyBasicCard(backgroundColor: .purple,
                                mainImage: "flag.fill",
                                sessionName: "유튭 라이브 버닝",
                                sessionTime: "8 PM - 10 PM")
                    MyBasicCard(backgroundColor: .red,
                                mainImage: "laptopcomputer",
                                sessionName: "영상 다시보기",
                                sessionTime: "8 AM - 9 AM")
                    MyBasicCard(backgroundColor: .yellow,
                                mainImage: "basket",
                                sessionName: "마트 장보기",
                                sessionTime: "10 AM - 11 AM")
                    MyBasicCard(backgroundColor: .blue,
                                mainImage: "tropicalstorm.circle",
                                sessionName: "히오스 한판하기",
                                sessionTime: "2 PM - 3 PM")
                    MyBasicCard(backgroundColor: .mint,
                                mainImage: "fork.knife.circle",
                                sessionName: "푸파 한판하기",
                                sessionTime: "4 PM - 5 PM")
                    MyBasicCard(backgroundColor: .green,
                                mainImage: "figure.australian.football",
                                sessionName: "피파 한판하기",
                                sessionTime: "2 PM - 3 PM")
                    MyBasicCard(backgroundColor: .red,
                                mainImage: "leaf.circle",
                                sessionName: "메이플 한판하기",
                                sessionTime: "2 PM - 3 PM")
                }.padding()
            }
            
            Circle()
                .foregroundColor(Color.yellow)
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                )
                .shadow(radius: 10)
                .padding(.trailing, 10)
        }
        
    }
}

struct MainView_previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
