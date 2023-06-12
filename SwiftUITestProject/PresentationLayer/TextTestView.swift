//
//  TextTestView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct TextTestView: View {
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    
    var today = Date()
    
    var trueOrFalse: Bool = false
    
    var number: Int = 123
    
    var body: some View {
        VStack {
            Text("안녕하세요.나는 바보입니다. 왜냐하면 바보이기 때문입니다. 너는 바보입니까?")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center) // 글자 가운데로 모으기
                .lineLimit(nil) // 글자 수 제한
                .shadow(color: Color.green, radius: 3.0, x: -10, y: 10)
                .padding() // 기본 패딩 10px
                .background(Color.red)
                .tracking(10) // 글자 사이의 간격
                .cornerRadius(20)
                .lineSpacing(20)
            
                // MARK: 이렇게 띄워서 작업하면 padding 차이 만큼 새로운 배경색 넣을 수 있다.
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
            
                .padding()
            
            Text("바보")
                .background(Color.gray)
                .foregroundColor(Color.white)
                .padding()
            
            Text("오늘의 날짜입니다 : \(today, formatter: TextTestView.dateFormat)")
                .background(Color.mint)
                .foregroundColor(Color.white)
                .padding()
            
            Text("참 혹은 거짓: \(String(trueOrFalse))")
            
            Text("숫자입니다: \(number)")
            
        }
        
    }
}

struct TextTestView_Previews: PreviewProvider {
    static var previews: some View {
        TextTestView()
    }
}
