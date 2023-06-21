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
        VStack(spacing: 10) {
            if let code = scannedCode {
                Text("self.scannedCode: \(self.scannedCode!)")
            }
            
            Button("Scan Code") {
                isPresentingScanner = true
            }
            
            Text("Scan a QR code to begin")
        }
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isPresentingScanner = false
                }
            }
        }
    }
}

struct QRCodeScannerExampleView_Preview: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}
