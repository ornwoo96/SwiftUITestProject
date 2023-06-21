//
//  QRCodeScannerExampleView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/20.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    
    var body: some View {
        ZStack {
            if let scanURL = self.scannedCode {
                MyWebView(urlToLoad: scanURL)
            } else {
                MyWebView(urlToLoad: "http://www.naver.com")
            }
            
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    self.isPresentingScanner = true
                }) {
                    Text("로또번호확인")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 5)
                        )
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                
                Spacer().frame(height: 30)
            }
        }
    }
    
    var scannerSheet: some View {
        ZStack {
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.sca nnedCode = code.string
                        self.isPresentingScanner = false
                    }
                })
            QRCodeGuideLineView()
        }
    }
}

struct QRCodeScannerExampleView_Preview: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}
