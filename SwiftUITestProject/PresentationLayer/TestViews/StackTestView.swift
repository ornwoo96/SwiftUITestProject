//
//  StackTestView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct StackTestView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
//                .padding(.bottom, 100)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
//                .padding(.vertical, 100)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.yellow)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
            
            ZStack {
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color.red)
                    .zIndex(1)
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.yellow)
                    .zIndex(1)
                
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.green)
                    .zIndex(1)
            }
            
        }
        .frame(width: 300)
        .background(Color.green)
    }
}

struct StackTestView_previews: PreviewProvider {
    static var previews: some View {
        StackTestView()
    }
}
