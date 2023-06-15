//
//  MainView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI

// MARK: NavigationView 를 뷰마다 감싸면 여러개의 네비게이션이 겹쳐서 사용되는 꼴임 그래서 네비게이션은 한번만 선언하고
// MARK: 타고 들어가는 뷰에서 hidden을 조절하는게 베스트

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
                            
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person.crop.circle")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                            }
                            
                            
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
