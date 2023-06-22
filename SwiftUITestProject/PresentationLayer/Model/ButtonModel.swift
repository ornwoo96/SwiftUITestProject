//
//  ButtonModel.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/22.
//

import SwiftUI

struct ButtonModel: Hashable {
    var id: UUID
    var name: String
    var color: Color
    var type: ButtonStyleType
    
    init(id: UUID = UUID(),
         name: String,
         color: Color,
         type: ButtonStyleType) {
        self.id = id
        self.name = name
        self.color = color
        self.type = type
    }
}

extension ButtonModel {
    static let buttonModelDummy: [ButtonModel] = {
        var resultArray: [ButtonModel] = []
        var colors: [Color] = [
            .blue, .green, .red , .yellow , .cyan
        ]
        var number = 0
        
        ButtonStyleType.allCases.forEach {
            resultArray.append(ButtonModel(name: $0.rawValue, color: colors[number], type: $0))
            number += 1
        }
        
        return resultArray
    }()
}
