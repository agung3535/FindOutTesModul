//
//  MaterialEffectTab.swift
//  FindOut
//
//  Created by Putra on 07/06/22.
//

import SwiftUI

struct MaterialEffectTab: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}


