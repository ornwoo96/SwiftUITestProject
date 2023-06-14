//
//  NavigationView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct NavigationTestView: View {
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("안녕 SwiftUI")
                    .fontWeight(.heavy)
                    .fontDesign(.monospaced)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                VStack {
                    
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    
                } // VStack
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.black) // isActivated가 true면 Yellow 그렇지 않다면
                .onTapGesture {
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true 이면 false 로 false 이면 true
                        self.isActivated.toggle()
                        print("VStack 클릭 되었습니다.")
                    }
                }
                
                // 네비게이션 버튼(링크)
                NavigationLink(destination: MyWebView(urlToLoad: "https://www.naver.com")) {
                    Text("네비게이션 버튼")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct NavigationView_previews: PreviewProvider {
    static var previews: some View {
        NavigationTestView()
    }
}
