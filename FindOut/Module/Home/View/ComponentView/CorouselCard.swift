//
//  CorouselCard.swift
//  FindOut
//
//  Created by Putra on 09/06/22.
//

import SwiftUI

struct CorouselCard<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    //properties
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.list = items
        self.content = content
        
    }
    
    var body: some View {
        GeometryReader { proxy in
            
            let width = (proxy.size.width - trailingSpace)
            HStack(spacing: spacing) {
                ForEach(list){ item in
                    content(item)
                        .frame(width: width)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({value in
                        let offset = value.translation.width
                        let progress = -offset / width
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 2),0)
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offset = value.translation.width
                        let progress = -offset / width
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 2),0)
                     
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
}

struct DataMovie: Identifiable {
    let id = UUID().uuidString
    var postImage: String
}

//struct CorouselCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
