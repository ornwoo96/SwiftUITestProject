//
//  SegmentedLayoutView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/19.
//

import SwiftUI

enum LayoutType {
    case table, gird, triple
}

struct SegmentedLayoutView: View {
    @State var selectedLayoutType: LayoutType = .table
    
    var body: some View {
        VStack {
            Picker(selection: .constant(5), label: Text("Picker"), content: {
                Text("1").tag(1)
                Text("2").tag(2)
            })
            Text("히히히")
        }
    }
}

struct SegmentedLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedLayoutView()
    }
}
