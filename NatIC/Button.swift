//
//  Button.swift
//  NatIC
//
//  Created by WX on 30/4/24.
//

import SwiftUI
import UIKit

struct ButtonV: View {
    @State private var isBarcodePressed = false
    @State private var isNRICPressed = false

    var body: some View {
        ZStack {
            // Image Layer
            
            
            Group {
                if isBarcodePressed {
                    Image("barcode")
                        .resizable()
                        .scaledToFill()
                        .offset(y: 2)
                        .edgesIgnoringSafeArea(.all)
                   

                } else if isNRICPressed {
                    Image("nrichide")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)

                } else {
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)

                }
            }
           
         
            HStack {
               
                // Barcode
                Button(action: {
                    isBarcodePressed.toggle()
                    resetOtherButtons(except: .barcode)
                    setScreenBrightness(1)
                    print("Toggled Barcode")
                        
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.clear)
                        .frame(width: 45, height: 45)
                }
                .offset(x: 180, y: 185)

                // NRIC
                Button(action: {
                    isNRICPressed.toggle()
                    resetOtherButtons(except: .nric)
                    print("Toggled NRIC")
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.clear)
                        .frame(width: 35, height: 35)
                }
                .offset(x: 10, y: -180)
                
            }
            
            GIFView(gifName: "holog")
                .frame(width: 50, height: 32)
                .aspectRatio(contentMode: .fit)
                .offset(x: -108, y: -159)
        }
    }

    private func setScreenBrightness(_ value: CGFloat) {
            if value >= 0.0 && value <= 1.0 {
                UIScreen.main.brightness = value
            }
        }
    
    
    
    // Function to reset other buttons
    private func resetOtherButtons(except button: ButtonType) {
        switch button {
        case .barcode:
            isNRICPressed = false

        case .nric:
            isBarcodePressed = false
        }
    }

    // Enum to identify button types
    private enum ButtonType {
        case barcode, nric
    }
}


#Preview {
    ButtonV()
}
