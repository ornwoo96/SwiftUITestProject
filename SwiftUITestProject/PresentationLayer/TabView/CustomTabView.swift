//
//  CustomTabView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/17.
//

import SwiftUI

enum TabIndex {
    case home
    case cart
    case profile
}

struct CustomTabView: View {
    @State var tabIndex: TabIndex
    @State var largerScale: CGFloat = 1.4
    
    private func changeMyView(tabIndex: TabIndex) -> MyView {
        switch tabIndex {
        case .cart:
            return MyView(backgroundColor: Color.purple, viewTitle: "장바구니")
        case .home:
            return MyView(backgroundColor: Color.green, viewTitle: "홈")
        case .profile:
            return MyView(backgroundColor: Color.blue, viewTitle: "프로필")
        }
    }
    
    private func changeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .home:
            return Color.green
        case .cart:
            return Color.purple
        case .profile:
            return Color.blue
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                self.changeMyView(tabIndex: tabIndex)
                
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation {
                            self.tabIndex = .home
                        }
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 20))
                            .scaleEffect(self.tabIndex == .home ? self.largerScale : 1.0)
                            .foregroundColor(self.tabIndex == .home ? changeIconColor(tabIndex: self.tabIndex) : Color.gray)                            .frame(width: geometry.size.width/3,
                                   height: 50)
                        
                    }.background(Color.orange)
                    
                    Button(action: {
                        withAnimation {
                            self.tabIndex = .cart
                        }
                    }) {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 20))
                            .scaleEffect(self.tabIndex == .cart ? self.largerScale : 1.0)
                            .foregroundColor(self.tabIndex == .cart ? changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                            .frame(width: geometry.size.width/3,
                                   height: 50)
                        
                        
                    }.background(Color.yellow)
                    
                    Button(action: {
                        withAnimation {
                            self.tabIndex = .profile
                        }
                    }) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 20))
                            .scaleEffect(self.tabIndex == .profile ? self.largerScale : 1.0)
                            .foregroundColor(self.tabIndex == .profile ? changeIconColor(tabIndex: self.tabIndex) : Color.gray)                            .frame(width: geometry.size.width/3,
                                   height: 50)
                        
                        
                    }.background(Color.white)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .home)
    }
}
