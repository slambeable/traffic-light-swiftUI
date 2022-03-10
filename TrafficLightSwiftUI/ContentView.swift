//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Андрей Евдокимов on 10.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textInButton = "START"
    @State private var lights: [Light] = [
        Light(color: .red, opacity: 0.3),
        Light(color: .yellow, opacity: 0.3),
        Light(color: .green, opacity: 0.3)
    ]

    private var button: some View {
        Button(action: {
            if (textInButton == "START") {
                textInButton = "NEXT"
                lights[0].opacity = 1
            } else {
                for (index, light) in lights.enumerated() {
                    if (light.opacity == 1) {
                        let nextIndex = lights.indices.contains(index + 1) ? index + 1 : 0

                        lights[index].opacity = 0.3
                        lights[nextIndex].opacity = 1
                    }
                }
            }
        }, label: {
            Text(textInButton)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 40))
        })
            .frame(width: 200, height: 70)
            .background(Color.blue)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 6))
    }

    var body: some View {
        VStack() {
            HStack {
                Spacer()
            }
            ForEach(lights) {light in
                light
            }
            Spacer()
            button
        }
        .padding()
        .background(Color.black)
    }
}

struct Light: View, Identifiable {
    let color: Color
    var opacity: Double
    var id: Color { color }

    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .padding(.bottom, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
