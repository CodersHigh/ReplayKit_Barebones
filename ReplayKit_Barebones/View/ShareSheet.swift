//
//  ShareSheet.swift
//  ReplayKit_Barebones
//
//  Created by 이로운 on 2022/07/29.
//

import SwiftUI

// UIKit Share Sheet
struct ShareSheet: UIViewControllerRepresentable {
    
    var items: [Any]
     
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
