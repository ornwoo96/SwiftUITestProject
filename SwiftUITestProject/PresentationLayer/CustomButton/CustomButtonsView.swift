//
//  CustomButtonsView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/21.
//

import SwiftUI

struct CustomButtonsView: View {
    private let buttonModelArray = ButtonModel.buttonModelDummy
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(buttonModelArray, id: \.self, content: { item in
                Button(action: {
                    hapTic()
                }) {
                    Text(item.name)
                }.buttonStyle(MyButtonStyle(color: item.color, type: item.type))
            })
        }
    }
    
    private func hapTic() {
        let hapTic = UIImpactFeedbackGenerator(style: .heavy)
        hapTic.impactOccurred()
    }
}

struct CustomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonsView()
    }
}
