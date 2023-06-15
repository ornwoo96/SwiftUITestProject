//
//  ProfileView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/15.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    
    var body: some View {
            ScrollView {
                VStack {
                    Image("pp")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 250, height: 250)
                        .overlay(
                            Circle()
                                .strokeBorder(Color.yellow, lineWidth: 15)
                        )
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                    
                    Text("개발하는 동우")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .padding(.bottom, 10)
                    
                    Text("구독 좋아요 부탁드립니다~~")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("구독하러 가기")
                                .fontWeight(.bold)
                                .frame(width: 150, height: 60)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(20)
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("오픈 채팅방 가기")
                                .fontWeight(.bold)
                                .frame(width: 150, height: 60)
                                .foregroundColor(.white)
                                .background(Color.orange)
                                .cornerRadius(20)
                        }
                        
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarItems(
                trailing: NavigationLink(destination: Text("설정창입니다.")) {
                    Image(systemName: "gear")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
            )
            .navigationTitle("내 프로필")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                self.isNavigationBarHidden = false
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
