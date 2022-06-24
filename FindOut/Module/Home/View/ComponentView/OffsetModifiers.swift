//
//  OffsetModifiers.swift
//  FindOut
//
//  Created by Putra on 16/06/22.
//

import SwiftUI


struct OffsetModifiers: ViewModifier{
    
    @Binding var offset : CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader{geo -> Color in
                
                let minY = geo.frame(in: .named("SCROLL")).minY
                
                DispatchQueue.main.async {
                    self.offset = minY
                }
                
                return Color.clear
            })
    }
}
