//
//  BillBoardCorousel.swift
//  FindOut
//
//  Created by Putra on 09/06/22.
//

import SwiftUI
import Kingfisher
import HomeOut
struct BillBoardCorousel: View {
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 125
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
    }
//    @ObservedObject var homePresenter: HomePresenter
    @State var router: HomeRouter
    @State var post: [HomePlayingModel]
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(0..<self.post.count) { index in
                        linkBuilder(for: self.post[index], content: {
                            GeometryReader { proxy in
                                let scale = getScale(proxy: proxy)
                                VStack(alignment: .leading, spacing: 8) {
                                    KFImage(URL(string: "\(API.imageURL)\(self.post[index].image)"))
                                        .loadDiskFileSynchronously()
                                        .cacheMemoryOnly()
                                        .fade(duration: 0.25)
                                        .resizable()
                                        .frame(width: 180)
                                        .clipped()
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(white: 0.4))
                                        )
                                        .shadow(radius: 3)
                                    Text(self.post[index].title)
                                        .font(.system(size: 12, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                    HStack(spacing: 0) {
                                        
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.orange)
                                            .font(.system(size: 14))
                                        Text("\(self.post[index].rating.removeZerosFromEnd())")
                                            .font(.system(size: 12))
                                    }.padding(.top, -4)
                                }
                                
                                    .scaleEffect(.init(width: scale, height: scale))
                                    .animation(Animation.easeOut(duration: 1), value: true)
                                    .padding(.vertical)
                            }
                            .frame(width: 125, height: 450)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 42)
                        })
                        
                    }
                }
            }
//            .background(.blue)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
        }.padding(.leading, 30)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        .background(.green)
        
    }
}

extension BillBoardCorousel {
    func linkBuilder<Content: View>(
      for category: HomePlayingModel,
      @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(
        destination: router.makeDetailView(model: category)) { content() }
    }
}

//struct BillBoardCorousel_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//
//    }
//}
