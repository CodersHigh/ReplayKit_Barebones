//
//  ContentView.swift
//  ReplayKit_Barebones
//
//  Created by 이로운 on 2022/07/29.
//

import SwiftUI

struct ContentView: View {
    @State private var isRecording: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            CircleView()
            Button {
                isRecording.toggle()
            } label: {
                Image(systemName: isRecording ? "record.circle.fill" : "record.circle")
            }
            .font(.largeTitle)
            .foregroundColor(isRecording ? .red : .black)
            .padding()
        }
    }
}
