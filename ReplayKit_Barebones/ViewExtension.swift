//
//  ViewExtension.swift
//  ReplayKit_Barebones
//
//  Created by 이로운 on 2022/07/29.
//

import SwiftUI
import ReplayKit

// 앱 화면 녹화를 위한 뷰 익스텐션
extension View {
    
    // 녹화 시작
    func startRecording(completion: @escaping (Error?) -> ()) {
        let recorder = RPScreenRecorder.shared()
        recorder.isMicrophoneEnabled = false
        
        recorder.startRecording(handler: completion)
    }
    
    // 녹화 중단
    func stopRecording() -> URL {
        let name = UUID().uuidString + ".mov"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(name)
        
        let recorder = RPScreenRecorder.shared()
        recorder.stopRecording(withOutput: url)
        
        return url
    }

    // 공유 시트
    func shareSheet(show: Binding<Bool>, items: [Any?]) -> some View {
        return self
            .sheet(isPresented: show) {
                let items = items.compactMap { item -> Any? in
                    return item
                }
                if !items.isEmpty {
                    ShareSheet(items: items)
                }
            }
    }
}
