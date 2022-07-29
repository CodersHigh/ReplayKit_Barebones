//
//  ContentView.swift
//  ReplayKit_Barebones
//
//  Created by 이로운 on 2022/07/29.
//

import SwiftUI

struct ContentView: View {
    private let circleSize: CGFloat = 150
    
    @State private var color = Color.primary
    @State private var offset = CGSize.zero
    
    var body: some View {

        // 탭할 시, 랜덤 색상으로 변경
        let tapGesture = TapGesture()
            .onEnded {
                withAnimation {
                    let randomRed: CGFloat = CGFloat(drand48())
                    let randomGreen: CGFloat = CGFloat(drand48())
                    let randomBlue: CGFloat = CGFloat(drand48())
                    color = Color(red: randomRed, green: randomGreen, blue: randomBlue, opacity: 1.0)
                }
            }
        
        // 드래그할 시, 손가락을 따라 이동
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - circleSize/2, height: value.startLocation.y + value.translation.height - circleSize/2)
            }
        
        VStack {
            Circle()
                .frame(width: circleSize, height: circleSize, alignment: .center)
                .foregroundColor(color)
                .gesture(tapGesture)
                .offset(offset)
                .gesture(dragGesture)
                .animation(.spring())
        }
    }
}
