//
//  HomePage.swift
//  FindOut
//
//  Created by Putra on 07/06/22.
//

import SwiftUI
import CoreFindOut
import HomeOut

struct HomePage: View {
    
    @State private var searchState = ""
    @State var currentIndex: Int = 0
    @State var post: [DataMovie] = []
    @State var menuModel: [MenuModel] = []
    @ObservedObject var homePresenter: GetListPresenter<Any?, HomePlayingModel, InteractorCore<Any, [HomePlayingModel], HomeModuleMovieRepo<HomeMovieLocaleDataSource, HomeRemoteDataSource, HomeMovieTransformer>>>
    var homeRouter: HomeRouter
    
    var body: some View {
//            NavigationView {
                ZStack {
                    Color("SecondaryColor")
                        .ignoresSafeArea()
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                        }
                        MenuSection(router: homeRouter, menu: self.menuModel)
                            .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
                            .padding(.top, 10)
                            .onAppear {
                                self.menuModel.append(MenuModel(id: 1, title: "Movie", icon: "film"))
                            }
                       
                        Text("Playing Now")
                            .font(.headline)
                        if homePresenter.isLoading {

                        } else if homePresenter.list.isEmpty {

                        } else {
                            BillBoardCorousel(router: homeRouter, post: self.homePresenter.list)
                        }
                        
                    }.navigationTitle("")
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .onAppear {
                    if self.homePresenter.list.count == 0 { // 2
                        self.homePresenter.getList(request: nil)
                    }
                    
                }
                .onDisappear {
                    
                }
            

            
    }
}

extension HomePage {
    func linkBuilder<Content: View>(
      for category: HomePlayingModel,
      @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(
        destination: homeRouter.makeDetailView(model: category)) { content() }
    }
}

//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}
