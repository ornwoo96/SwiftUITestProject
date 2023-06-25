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
        print("내 uuid: \(newTodo.id)")
        newList.append(newTodo)
    }
    
    return newList
}

struct ToDoList: View {
    // todoItems로 path를 관리하여 navigation 이동한다.
    // todoItems에 넣은 값들을 통해 링크를 타고 넘어감
    @State var todoItems = [TodoItem]()
    @State var activeUUID: UUID?
    
    let dummyData = prepareData()
    
    var body: some View {
        
        NavigationStack(path: $todoItems) {
            List(dummyData) { todoItem in
                NavigationLink("\(todoItem.title)",
                               value: todoItem)
            }
            .navigationTitle(Text("할 일 목록"))
            .navigationDestination(for: TodoItem.self) { item in
                Text("\(item.title)")
            }
            .onOpenURL(perform: { url in
                print(url)
                if case .todoItem(let id) = url.detailPage {
                    print("넘어온 id: \(id)")
                    activeUUID = id
                    if let first = dummyData.firstIndex(where: {
                        $0.id == id
                    }) {
                        print("찾았다.")
                        // 여기서 넣은 데이터가 링크타고 넘어가게끔 해드림
                        todoItems.append(dummyData[first])
                    } else {
                        todoItems.removeAll()
                    }
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
