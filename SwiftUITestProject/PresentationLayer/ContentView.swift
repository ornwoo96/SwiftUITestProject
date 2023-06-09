//
//  ContentView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false

    var body: some View {
        NavigationView {
            
            VStack {
                Text("안녕 SwiftUI")
                    .fontWeight(.heavy)
                    .fontDesign(.monospaced)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                VStack {
                    
                    MyVStackView()
                    MyVStackView()
                    MyVStackView()
                    
                } // VStack
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.black) // isActivated가 true면 Yellow 그렇지 않다면
                .onTapGesture {
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true 이면 false 로 false 이면 true
                        self.isActivated.toggle()
                        print("VStack 클릭 되었습니다.")
                    }
                }
                
                // 네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView()) {
                    Text("네비게이션 버튼")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }
            }
        }
    }
}

extension ContentView {
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
