//
//  GeometryReaderView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/15.
//

import SwiftUI

enum TextIndex {
    case one
    case two
    case three
}

struct GeometryReaderView: View {
    @State var index: TextIndex = .one // State의 값이 바뀌면 뷰를 전체적으로 다시 그린다.
    
    // CenterPosition Geometry Proxy 이런식으로 centerPosition 값을 셋팅해놓고 쓸 수 있다.
    let centerPosition: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX,
                       y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
//            VStack { // 지오메트릭 포지션문제 -> VStack을 감싸서 Space 공간을 주는 것도 한 방법
//                Spacer()
                
                HStack(alignment: .center, spacing: 0) {
                    Text("1")
                        .frame(width: geometry.size.width/3, height: self.index == .one ? 60 : 30)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .onTapGesture {
                            withAnimation {
                                self.index = .one
                            }
                        }
                    
                    Text("2")
                        .frame(width: geometry.size.width/3, height: self.index == .two ? 60 : 30)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .onTapGesture {
                            withAnimation {
                                self.index = .two
                            }
                        }
                    
                    Text("3")
                        .frame(width: geometry.size.width/3, height: self.index == .three ? 60 : 30)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .onTapGesture {
                            withAnimation {
                                self.index = .three
                            }
                        }
                    
                } // HStack
                .frame(width: geometry.size.width, height: 100)
                .background(Color.yellow)
//                .position(CGPoint(x: geometry.frame(in: .local).midX,
//                                  y: geometry.frame(in: .local).midY))
                // 이렇게 포지션 값을 줄 수 도 있음
                .position(centerPosition(geometry))
                
//                Spacer()
//            }
            
        } // GeometryReader
        .background(Color.black)
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
