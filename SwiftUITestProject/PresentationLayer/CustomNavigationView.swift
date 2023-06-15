//
//  CustomNavigationView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/14.
//

import SwiftUI

// 옵션 + 커맨드 + 엔터 -> 미리보기 창 열기
// 옵션 + 커맨드 + P -> 미리보기 창 리로드

struct CustomNavigationView: View {
    var body: some View {
        
        NavigationView {
            MyList()
                .navigationBarTitle("바보인가?")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(
                    leading: Button(action: {
                        print("호호")
                    }) {
                        Text("호호")
                    }, trailing: Button(action: {
                        print("호호")
                    }) {
                        Image(systemName: "bookmark.fill")
                    }
                )
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
