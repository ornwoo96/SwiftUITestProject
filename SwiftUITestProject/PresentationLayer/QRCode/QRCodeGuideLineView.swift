//
//  QRCodeWebView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/21.
//

import SwiftUI

struct QRCodeGuideLineView: View {
    
    let centerPosition: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX,
                       y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 10,
                                           dash: [11]))
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 3.8)
                .foregroundColor(Color.yellow)
                .position(centerPosition(geometry))
        }
    }
}

struct QRCodeGuideLineView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}
