//
//  MyList.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/13.
//

import SwiftUI

struct MyList: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        
        List {
            Section(header: Text("오늘 할일")) {
                ForEach(1...10, id: \.self) { itemIndex in
                    MyBasicCard(cardEntity: CardEntity(backgroundColor: .blue,
                                                       mainImage: "book.fill",
                                                       sessionName: "책 읽기",
                                                       sessionTime: "1 PM - 3 PM"))
                    .hideRowSeparator()
//                    .listRowSeparator(.hidden)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(header: Text("내일 할일")) {
                ForEach(1...10, id: \.self) { itemIndex in
                    MyBasicCard(cardEntity: CardEntity(backgroundColor: .blue,
                                                       mainImage: "book.fill",
                                                       sessionName: "책 읽기",
                                                       sessionTime: "1 PM - 3 PM"))
                }
            }
        }
        .listStyle(.grouped)
        .background(Color.clear)
        .navigationTitle("내 목록")
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}

struct HideRowSeparatorModifier: ViewModifier {
    static let defaultListRowHeight: CGFloat = 44
    
    var insets: EdgeInsets
    var background: Color
    
    init(insets: EdgeInsets, background: Color){
        self.insets = insets
        
        var alpha: CGFloat = 0
        
        UIColor(background).getWhite(nil, alpha: &alpha)
        assert(alpha == 1, "")
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0, maxWidth: .infinity, minHeight: Self.defaultListRowHeight,   alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}

extension EdgeInsets{
    static let defaultListRowInsets = Self(top: 10, leading: 10, bottom: 10, trailing: 10)
}

extension View {
    func hideRowSeparator(insets: EdgeInsets = .defaultListRowInsets,
                          background: Color = .white) -> some View {
        modifier(HideRowSeparatorModifier(insets: insets, background: background))
    }
}
