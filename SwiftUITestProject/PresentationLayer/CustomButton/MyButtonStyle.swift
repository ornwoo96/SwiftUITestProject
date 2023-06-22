//
//  MyButtonStyle.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/21.
//

import SwiftUI

enum ButtonStyleType: String, CaseIterable {
    case tab = "탭"
    case long = "롱"
    case smaller = "스몰러"
    case rotate = "로테이트"
    case blur = "블러"
}

struct MyButtonStyle: ButtonStyle {
    var color: Color
    var type: ButtonStyleType
    
    func makeBody(configuration: Configuration) -> some View {
        switch type {
        case .tab:
            configuration
                .label
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
                .background(color)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
                .animation(.spring(), value: configuration.isPressed)
            
        case .long:
            configuration
                .label
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
                .background(color)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 1.5 : 1.0)
                .animation(.spring(), value: configuration.isPressed)
            
        case .smaller:
            configuration
                .label
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
                .background(color)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
                .animation(.spring(), value: configuration.isPressed)
            
        case .rotate:
            configuration
                .label
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
                .background(color)
                .cornerRadius(20)
                .rotationEffect(configuration.isPressed ? .degrees(180) : .degrees(0))
                .animation(.spring(), value: configuration.isPressed)
            
        case .blur:
            configuration
                .label
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
                .background(color)
                .cornerRadius(20)
                .blur(radius: configuration.isPressed ? 1.0 : 0)
                .animation(.spring(), value: configuration.isPressed)
        }
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Button Clicked!")
        }, label: {
            Text("호호")
        }).buttonStyle(MyButtonStyle(color: .red, type: .tab))
    }
}
