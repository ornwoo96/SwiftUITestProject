//
//  MainView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

struct MainView: View {
    var cardEntityArray = CardEntity.dummyData
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack {
                        HStack {
                            NavigationLink(destination: MyList(isNavigationBarHidden: $isNavigationBarHidden)) {
                                Image(systemName: "list.bullet")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                            }.padding(.leading, 10)
                            
                            Spacer()
                            
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                            
                        }.padding(.bottom, 10)
                        
                        Text("동우의 오늘 할 일목록")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                        
                        
                        MyProjectCard()
                        
                        ForEach(cardEntityArray, id: \.self) { item in
                            MyBasicCard(cardEntity: item)
                        }
                    }
                    .padding()
                    
                }
                
                Circle()
                    .foregroundColor(Color.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .shadow(radius: 10)
                    .padding(.trailing, 10)
            } // ZStack
            
            .navigationBarTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
            
        } // NavigationView
    }
}

struct MainView_previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
