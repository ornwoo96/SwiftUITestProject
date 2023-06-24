//
//  ToDoList.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/23.
//

import SwiftUI

struct TodoItem: Identifiable, Hashable {
    var id: UUID
    var title: String
}

func prepareData() -> [TodoItem] {
    var newList = [TodoItem]()
    
    for i in 0...20 {
        let newTodo = TodoItem(id: UUID(), title: "내 할일 \(i)")
        newList.append(newTodo)
    }
    
    return newList
}

struct ToDoList: View {
    @State var todoItems = [TodoItem]()
    @State var activeUUID: UUID?
    
    init() {
        let data = prepareData()
        _todoItems = State(initialValue: data)
        data.forEach {
            print($0.id)
        }
    }
    
    var body: some View {
        NavigationView {
            List(todoItems) { todoItem in
                NavigationLink(
                    destination: Text("\(todoItem.title)"),
                    tag: todoItem.id,
                    // activeUUID 값이 변경되면 해당 하는 링크로 이동
                    selection: $activeUUID
                ) {
                    Text("\(todoItem.title)")
                }
                
                
//                NavigationLink(value: activeUUID,
//                               label: <#T##() -> View#>)
                
//                NavigationLink(
//                    destination: Text("ㅇㅇㅇ\(todoItem.title)"),
//                    label: {                    Text("\(todoItem.title)")
//                })
            }
            .navigationTitle(Text("할 일 목록"))
            .onOpenURL(perform: { url in
                if case .todoItem(let id) = url.detailPage {
                    print("넘어온 id: \(id)")
                    activeUUID = id
                }
            })
        }
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
