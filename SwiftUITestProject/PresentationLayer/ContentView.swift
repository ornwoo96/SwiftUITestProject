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
    
    private var isActivated: Bool = false

    var body: some View {
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
            .padding(10)
            .background(isActivated ? Color.yellow : Color.black) // isActivated가 true면 Yellow 그렇지 않다면
            .onTapGesture {
                
                print("VStack 클릭 되었습니다.")
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
