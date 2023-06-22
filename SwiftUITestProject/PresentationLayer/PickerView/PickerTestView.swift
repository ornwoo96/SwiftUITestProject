//
//  PickerTestView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/20.
//

import SwiftUI

struct PickerTestView: View {
    @State var selectionValue = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Circle()
                .fill()
                .frame(width: 100, height: 100)
                .foregroundColor(convert(selectionValue))
            
            Text("선택된 값 : \(selectionValue)")
            
            Text("선택된 색상 : \(convert(selectionValue))")
            
            Picker("픽커",
                   selection: $selectionValue,
                   content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            })
            .pickerStyle(.segmented)
            
            Picker("픽커",
                   selection: $selectionValue,
                   content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            })
            .pickerStyle(.wheel)
            .frame(width: 75, height: 100)
            .clipped()
            .padding(10)
            .border(convert(selectionValue), width: 10)
            
            
            
        }.padding(.horizontal, 50)
    }
    
    private func convert(_ number: Int) -> String {
        switch number {
        case 0:
            return "레드"
        case 1:
            return "그린"
        case 2:
            return "블루"
        default:
            return "없어요"
        }
    }
    
    private func convert(_ number: Int) -> Color {
        switch number {
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default:
            return Color.white
        }
    }
}

struct PickerTestView_Previews: PreviewProvider {
    static var previews: some View {
        PickerTestView()
    }
}
