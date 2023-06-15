//
//  MyProjectCard.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct MyProjectCard: View {
    @State
    var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            
            Text("비모 유튜브 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
            
            Spacer().frame(height: 20)
            
            HStack {
                Image("76")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(Color.red)
                        
                    )
                
                Image("80")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Image("94")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                Spacer()
                Button(action: {
                    self.shouldShowAlert = true
                }) {
                    Text("접속")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("바보입니다."))
                }
                
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
