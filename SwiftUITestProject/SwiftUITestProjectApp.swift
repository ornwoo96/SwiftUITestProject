//
//  SwiftUITestProjectApp.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/07.
//

import SwiftUI

@main
struct SwiftUITestProjectApp: App {
    let persistenceController = PersistenceController.shared
    
    @State var selectedTab = TabIdentifier.todos

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab,
                    content: {
                ToDoList().tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("할 일 목록")
                    }
                }.tag(TabIdentifier.todos)
                
                ToDoProfileView().tabItem {
                    VStack {
                        Image(systemName: "person.circle.fill")
                        Text("프로필")
                    }
                }.tag(TabIdentifier.profile)
            })
            .onOpenURL(perform: { url in
                // 열려야 하는 url 처리
                guard let tabId = url.tabIdentifier else { return }
                selectedTab = tabId
            })
        }
    }
}


struct SwiftUITestProjectApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

// 어떤 탭이 선택되었는지 여부
enum TabIdentifier: Hashable {
    case todos
    case profile
}

// 어떤 페이지를 보여줘야하는지?
enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    // info 에서 추가한 딥링크가 들어왔는지 여부
    var isDeeplink: Bool {
        return scheme == "deeplink-swiftui"
    }
    
    // url 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        // deeplink-swiftui://hohoho
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default: return nil
        }
    }
    
    var detailPage: PageIdentifier? {
        
        // deeplink-swiftui://todos/todoId
        guard let tagId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1]) else { return nil }
        
        print("pathComponents: \(pathComponents)")
        
        switch tagId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
        
    }
}
