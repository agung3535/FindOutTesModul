//
//  SlideTab.swift
//  FindOut
//
//  Created by Putra on 13/06/22.
//

import SwiftUI
import HomeOut

struct SlideTab: View {
    @State var indexTab = 0
    @State var post = [HomePlayingModel]()
    @State var router: HomeRouter
    var body: some View {

            ZStack {
                Color("SecondaryColor")
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        Text("Movie")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .background(self.indexTab == 0 ? Color("BaseTintColor") : .white)
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.indexTab = 0
                            }
                            
                        Text("Tv Show")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .background(self.indexTab == 1 ? Color("BaseTintColor") : .white)
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.indexTab = 1
                            }
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .padding(.vertical, 10)
                    .background(Color("SecondaryColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    TabView(selection: $indexTab, content: {
                        BillBoardCorousel(router: router, post: self.post)
                    }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
        
    }
}

//struct SlideTab_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideTab()
//            .previewInterfaceOrientation(.portrait)
//    }
//}
