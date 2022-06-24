//
//  TabBar.swift
//  FindOut
//
//  Created by Putra on 07/06/22.
//

import SwiftUI
import CoreFindOut
import HomeOut
import FavoriteModule
struct TabBar: View {
    
    @State var selectedTab: Tab = .home
    
    
    
    @Namespace var animation
    
    @State var currentXValue: CGFloat = 0
//    @State var homePresenter: HomePresenter
    @ObservedObject var homePresenter: GetListPresenter<Any?, HomePlayingModel, InteractorCore<Any, [HomePlayingModel], HomeModuleMovieRepo<HomeMovieLocaleDataSource, HomeRemoteDataSource, HomeMovieTransformer>>>
    @ObservedObject var favoritePresenter: FavoritePresenter<[FavoriteListEntity]?, FavoriteModel, InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource,FavoriteRemoteDataSource, FavoriteModuleTransformer>>>
    var router: HomeRouter
    var favRouter: FavoriteRouter
    var body: some View {
        GeometryReader { geo in
            TabView(selection: $selectedTab, content: {
                HomePage(homePresenter: homePresenter, homeRouter: router)
                    .tag(Tab.home)
//                Text("\(currentXValue)")
                FavoritePage(favoritePresenter: favoritePresenter, favoriteRouter: favRouter)
                    .tag(Tab.favorite)
                ProfilePage()
                    .tag(Tab.profile)
            })
            //curved
            .overlay(
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        tabButton(tab: tab)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
                .background(
                        Color("MainColor")
                            .clipShape(BottomCurve(currentXValue: currentXValue == 0 ? geo.frame(in: .global).midX / 2.388 : currentXValue)
                                         )
                )
                ,
                alignment: .bottom
            )
            .ignoresSafeArea(.all ,edges: .bottom)
        }
    }
    
    //tabbutton
    @ViewBuilder
    func tabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button {
                withAnimation(.spring()) {
                    selectedTab = tab
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                Image(systemName: tab.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(selectedTab == tab ? 15 : 0)
                    .background(
                        ZStack {
                            if selectedTab == tab {
                                Color("MainColor")
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: selectedTab == tab ? -50 : 0)

            }
            //setting initial curve position
            .onAppear {
                if tab == Tab.allCases.first && currentXValue == 0 {
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 30)
    }
    
}

// struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}

enum Tab: String, CaseIterable {
    case home = "house.fill"
    case favorite = "star.fill"
    case profile = "person.fill"
}

extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
    
}
