//
//  MyTabView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/15.
//

import SwiftUI

struct MyTabView: View {
    
    var body: some View {
        TabView {
            
            MyView(backgroundColor: .red, viewTitle: "1번 화면")
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("1번")
                }
                .tag(0)
            
            MyView(backgroundColor: .orange, viewTitle: "2번 화면")
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("2번")
                }
                .tag(1)
            
            MyView(backgroundColor: .purple, viewTitle: "3번 화면")
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
