//
//  PickerTest2View.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/20.
//

import SwiftUI

struct PickerTest2View: View {
    @State var filterValue: SType = .low
    
    @State var mySModelList: [SModel] = []
    
    init() {
        var newList: [SModel] = []
        
        for i in 0..<20 {
            let newModel = SModel(name: "내 친구\(i)",
                                  type: SType.allCases.randomElement()!)
            newList.append(newModel)
        }
        
        _mySModelList = State(initialValue: newList)
    }
    
    var body: some View {
        VStack {
            Text("FilterValue: \(filterValue.rawValue)")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
            List {
                Section(
                    header: Text("언제 동창?")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                ) {
                    Picker("",selection: $filterValue ,content: {
                        Text("초등학교").tag(SType.low)
                        Text("중학교").tag(SType.middle)
                        Text("고등학교").tag(SType.high)
                    })
                    .pickerStyle(.segmented)
                }
                
                Section {
                    ForEach(mySModelList.filter {
                        $0.type == filterValue
                    }) { friendItem in
                        GeometryReader { geometry in
                            HStack {
                                Text("name: \(friendItem.name)")
                                    .frame(width: geometry.size.width/3)
                                
                                Divider()
                                
                                Text("school: \(friendItem.type.rawValue)")
                                    .frame(width: geometry.size.width/2)
                            }
                        }
                    }
                }
            }
            .listStyle(.grouped)
        }
    }
}

struct PickerTest2View_Previews: PreviewProvider {
    static var previews: some View {
        PickerTest2View()
    }
}
