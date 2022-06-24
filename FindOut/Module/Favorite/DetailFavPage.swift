//
//  DetailFavPage.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import SwiftUI
import FavoriteModule
import CoreFindOut

struct DetailFavPage: View {
//    @StateObject var detailGameViewModel = DetailViewModel()
//    var gameId : String
    @ObservedObject var presenter: DetailFavPresenter
    @ObservedObject var favoritePresenter: FavoritePresenter<[FavoriteListEntity]?, FavoriteModel, InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource,FavoriteRemoteDataSource, FavoriteModuleTransformer>>>
    var playingModel = [PlayingModel]()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
            GeometryReader{geo in
                ZStack{
                    let topEdge = geo.safeAreaInsets.top
                    
                        DetailPageContent(detailData: PlayingMapper.mapFavModelToPlayModel(input: self.presenter.detail!), topEdge: topEdge, favoritePresenter: self.favoritePresenter)
                }

                
            }
            .onAppear(perform: {
                
//                detailGameViewModel.getDetailGame(gameId: gameId)
            })
            .navigationTitle("Movie")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.white)
                    .frame(width: 40, height: 40)
                    .background(Color("MainColor"))
                    .clipShape(Circle())
            })
    }
}
