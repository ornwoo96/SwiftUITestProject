//
//  SModel.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/20.
//

import Foundation

enum SType: String, CaseIterable {
    case low = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

struct SModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var type: SType
}

extension SModel {
    static var dummyData: [SModel] = {
        var resultArray: [SModel] = []
        
        for i in 0...9 {
            for i in 0...2 {
                
            }
        }
        
        return []
    }()
}
