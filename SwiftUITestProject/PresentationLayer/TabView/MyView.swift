//
//  MyView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/15.
//

import SwiftUI

struct MyView: View {
    private let backgroundColor: Color
    private let viewTitle: String
    
    init(backgroundColor: Color,
         viewTitle: String) {
        self.backgroundColor = backgroundColor
        self.viewTitle = viewTitle
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(width: geometry.size.width)
                
                Text(viewTitle)
                    .font(.system(size: 30))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(width: geometry.size.width)
            }
            .background(backgroundColor)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(backgroundColor: .accentColor, viewTitle: "첫화면")
    }
}
