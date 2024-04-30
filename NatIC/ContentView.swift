//
//  ContentView.swift
//  NatIC
//
//  Created by WX on 30/4/24.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    @State private var shimmering = false
    @State private var isPressed = false
    
    @State var hidebutton = false
    
    var body: some View {
        
        
        ZStack { 
            
            ShimmeringEllipseView()
                .offset(x: -105, y: -160)
            
            Image("lh")
                .resizable()
                .opacity(0.6)
                .frame(width: 30, height: 35)
                .offset(x: -105, y: -157)
            
            
        }
    }
}





#Preview {
    ContentView()
}



struct ShimmeringEllipseView: View {
    @State private var shimmering = false

    var body: some View {
        Ellipse()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 1.0, green: 0.95, blue: 0.6),  // Light bright yellow
                        Color(red: 0.6, green: 0.9, blue: 1.0),   // Light teal-ish blue
                        Color(red: 0.9, green: 0.7, blue: 1.0)    // Light purple
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: 43, height: 30)
//            .offset(x: -105, y: -50)
            .mask(
                Ellipse()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .clear, location: 0),
                                .init(color: .white, location: 0.5),
                                .init(color: .clear, location: 1),
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .opacity(0.6)
                    .offset(x: shimmering ? 100 : -100)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    shimmering.toggle()
                }
            }
    }
}

#Preview {
    ButtonV()
}
