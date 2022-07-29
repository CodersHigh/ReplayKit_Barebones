//
//  ContentView.swift
//  ReplayKit_Barebones
//
//  Created by 이로운 on 2022/07/29.
//

import SwiftUI

struct ContentView: View {
    @State private var isRecording: Bool = false
    @State private var url: URL?
    @State private var shareVideo: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            CircleView()
            
            // 녹화 버튼
            Button {
                switch isRecording {
                case true:
                    // 녹화 중이라면, 멈추기
                    self.url = stopRecording()
                    isRecording = false
                    shareVideo = true
                case false:
                    // 녹화 중이 아니라면, 시작하기
                    startRecording { error in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }
                        isRecording = true
                    }
                }
            } label: {
                Image(systemName: isRecording ? "record.circle.fill" : "record.circle")
            }
            .font(.largeTitle)
            .foregroundColor(isRecording ? .red :  .black)
            .padding()
            .shareSheet(show: $shareVideo, items: [url])
        }
    }
}
