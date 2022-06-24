//
//  DetailMovieContent.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import SwiftUI
import Kingfisher
import FavoriteModule
import CoreFindOut
import MovieModule

struct DetailMovieContent: View {
    var detailData : MovieModulePlayingModel
//    var ssGame : [ScreenshotResource]
    var topEdge : CGFloat
    @State var isFavorite : Bool = false
    @State var isToast = false
    @State var offset : CGFloat = 0
    @ObservedObject var favoritePresenter: FavoritePresenter<[FavoriteListEntity]?, FavoriteModel, InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource, FavoriteModuleTransformer>>>
    
    var body: some View {
        GeometryReader{ geosize in
            ScrollView(.vertical,showsIndicators:false){
                
                    VStack(alignment:.leading){
                            GeometryReader{geo in
                                if detailData.image != nil {
                                    TopBanner(imageUrl:detailData.image,topEdge: topEdge,offset: $offset)
                                    .frame(maxWidth:.infinity)
                                    .frame(height:UIScreen.main.bounds.height/3 + offset,alignment:.bottom)
                                    .mask(CustomCorner(corners: [.bottomRight], radius: 25))
                                }

                            }.frame(height: UIScreen.main.bounds.height/3)
                            .offset(y: -offset) //fixing top scroll
                        HStack{
                            if detailData.title != nil{
                                Text(detailData.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.leading,10)
                            }
                            Spacer()
                            
                            Button(action: {
                                if favoritePresenter.isFavorite {
                                    
                                } else {
                                   
                                    
                                    favoritePresenter.addFavorite(id: "\(detailData.id)", endPoint: EndPoints.EP.detailMovie("\(detailData.id)").url)
                                }
//                                if detailViewModel.isFavorite {
//                                    if detailData.name != nil {
//                                        detailViewModel.deleteFavorite(object: detailViewModel.favGameDataNew[0])
//                                    }
//                                }else{
//                                    if(detailData.name != nil && detailData.genres != nil && detailData.backgroundImage != nil){
//                                        detailViewModel.addFavorite(name: detailData.name!, image: detailData.backgroundImage!, genre: detailData.genres!)
//                                    }
//                                }
                            }, label: {
                                Image(systemName: (self.favoritePresenter.isFavorite ? "heart.fill" : "heart"))
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: geosize.size.width/15, height: geosize.size.width/15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                            .padding(.trailing,10)
                        
                        }
                        .padding(.horizontal,10)
                        Text(detailData.overview ?? "")
                            .font(.caption)
                            .padding()
                        }.modifier(OffsetModifiers(offset: $offset))
                

                
            }
            .onAppear(perform: {
                if(detailData.title != nil) {
//                    favoritePresenter
                }
//                if(detailData.title != nil){
//                    detailViewModel.isFavoriteGame(name: String(detailData.name!))
//                }
            })
            .coordinateSpace(name: "SCROLL")
        }
        
        
    }
}
//
//struct DetailPageContent_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPage(presenter: "")
//    }
//}

