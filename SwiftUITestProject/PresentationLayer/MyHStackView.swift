//
//  MyHStackView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/07.
//

import SwiftUI

// MARK: 따로 파일을 파서 정리할 수 있음 customView 만들기 완성!?!?
struct MyVStackView: View {
    var body: some View {
        HStack {
            Text("1")
                .fontWeight(.bold)
                .font(.system(size: 60))
            
            Text("2")
                .fontWeight(.bold)
                .font(.system(size: 60))
            
            Text("3")
                .fontWeight(.bold)
                .font(.system(size: 60))

        } // HStack
        .background(Color(.red))
        .padding(5)
    }
}


struct MyHStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
