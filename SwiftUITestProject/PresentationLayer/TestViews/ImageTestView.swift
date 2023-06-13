//
//  ImageTestView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct ImageTestView: View {
    var body: some View {
        VStack {
            
//            Image(systemName: "bolt.circle")
//                .font(.system(size: 200))
//                .foregroundColor(.yellow)
//                .shadow(color: .gray, radius: 2, x: 2, y: 10)
            Image("MyImage")
                .resizable()
                .scaledToFill()
//                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                .overlay(
                    Circle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                )
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 10)
                        .padding()
                )
                .overlay(
                    Circle()
                        .stroke(Color.yellow, lineWidth: 10)
                        .padding(30)
                )
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 10)
                )
                .overlay(
                    Text("호호")
                        .foregroundColor(Color.white)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                )

            
//                .clipped()
//                .edgesIgnoringSafeArea(.all) // 세이프 에어리아 삭제
        }
    }
}


struct ImageTestView_previews: PreviewProvider {
    static var previews: some View {
        ImageTestView()
    }
}
