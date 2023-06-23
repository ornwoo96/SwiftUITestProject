//
//  PopupViews.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/22.
//

import SwiftUI
import PopupView

struct PopupViews: View {
    @State var showingPopup = false
    @State var bottomToastShowing = false
    @State var topToastShowing = false
    
    private var windowInsets: UIEdgeInsets = {
        let scenes = UIApplication.shared.connectedScenes
        let widowScene = scenes.first as? UIWindowScene
        guard let window = widowScene?.windows.first?.safeAreaInsets as? UIEdgeInsets else {
            return UIEdgeInsets()
        }
        
        return window
    }()
    
    func createBottomSolidMessage() -> some View {
        HStack(spacing: 10) {
            
            Image(systemName: "book.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text("토스트 메세지 입니다.")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                

                Text("토스트 메세지 입니다.")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider()
                    .opacity(0)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, 20)
        .padding(.bottom, windowInsets.bottom == 0 ? 15 : 25)
        .padding(.leading, 20)
        .background(Color.purple)
        .shadow(radius: 10)
    }
    
    func createTopSolidMessage() -> some View {
        HStack(spacing: 10) {
            
            Image("pp")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .overlay(content: {
                    Circle()
                        .stroke(style: StrokeStyle())
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.yellow)
                })
            
            VStack(alignment: .leading) {
                Text("토스트 메세지 입니다.")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                

                Text("토스트 메세지 입니다.")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider()
                    .opacity(0)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, windowInsets.bottom == 0 ? 10 : 50)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .background(Color.purple)
        .shadow(radius: 10)
    }
    
    func createBottomToastMessage() -> some View {
        HStack(spacing: 10) {
            Image("pp")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .overlay(content: {
                    Circle()
                        .stroke(style: StrokeStyle())
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.yellow)
                })
            
            VStack(alignment: .leading) {
                Text("내 고양이")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                
                Text("awdasdawdasfasdawdasfasdawdasdasfasfasdawdafasdawdawdadadwdawdawdawdawdawdawdawdawdawdawdawdawd")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                Divider()
                    .opacity(0)
            }
        }
        .frame(width: 300)
        .padding(15)
        .background(Color.green)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.bottom, 15)
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(action: {
                    self.showingPopup = true
                }, label: {
                    Text("바텀 솔리드 메세지")
                        .padding()
                        .background(Color.purple)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                })
                
                Button(action: {
                    self.bottomToastShowing = true
                }, label: {
                    Text("바텀 토스트 메세지")
                        .padding()
                        .background(Color.green)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                })
                
                Button(action: {
                    self.topToastShowing = true
                }, label: {
                    Text("탑 토스트 메세지")
                        .padding()
                        .background(Color.green)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                })
            }
        }
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $showingPopup,
               view: { createBottomSolidMessage() },
               customize: {
            $0
                .type(.default)
                .animation(.default)
                .autohideIn(2)
                .closeOnTap(true)
                .autohideIn(2)
                .closeOnTapOutside(true)
                .position(.bottom)
        })
        .popup(isPresented: $bottomToastShowing,
               view: { createBottomToastMessage() },
               customize: {
            $0
                .type(.default)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .autohideIn(2)
                .closeOnTapOutside(true)
                .position(.bottom)
        })
        .popup(isPresented: $topToastShowing,
               view: { createTopSolidMessage() },
               customize: {
            $0
                .type(.default)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .autohideIn(2)
                .closeOnTapOutside(true)
                .position(.top)
        })
    }
}

struct PopupViews_Previews: PreviewProvider {
    static var previews: some View {
        PopupViews()
    }
}
