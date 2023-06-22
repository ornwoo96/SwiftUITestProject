//
//  TextFieldView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/22.
//

import SwiftUI

struct TextFieldView: View {
    @State private var inputValue: String = ""
    @State private var inputSecureValue: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TextField("사용자 이름",text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .textContentType(.oneTimeCode)
                    .textCase(.lowercase)
                    .textInputAutocapitalization(.never)
                
                Button(action: {
                    self.inputValue = ""
                }) {
                    if self.inputValue.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            HStack {
                SecureField("비밀번호", text: $inputSecureValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textCase(.lowercase)
                
                Button(action: {
                    self.inputSecureValue = ""
                }) {
                    if self.inputSecureValue.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Text("비밀번호 : \(inputSecureValue)")
        }
        .padding(.horizontal, 50)
        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
