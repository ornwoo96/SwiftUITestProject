//
//  MyVStackView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/08.
//

import SwiftUI

// MARK: 따로 파일을 파서 정리할 수 있음 customView 만들기 완성!?!?**

struct MyVStackView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // 생성자 생성
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
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
        .background(self.isActivated ? Color(.green) : Color(.red))
        .padding(self.isActivated ? 10 : 0)
    }
}

struct MyHStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
