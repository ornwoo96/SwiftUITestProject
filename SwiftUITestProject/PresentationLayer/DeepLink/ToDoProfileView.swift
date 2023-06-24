//
//  ProfileView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/24.
//

import SwiftUI

struct ToDoProfileView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.purple)
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .overlay(
                Text("프로필")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    .foregroundColor(.white)
            )
    }
}

struct ToDoProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoProfileView()
    }
}
