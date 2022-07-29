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

}