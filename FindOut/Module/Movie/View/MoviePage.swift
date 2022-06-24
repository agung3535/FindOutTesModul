//
//  MoviePage.swift
//  FindOut
//
//  Created by Putra on 16/06/22.
//

import SwiftUI
import CoreFindOut
import MovieModule
import HomeOut

struct MoviePage: View {
    var type = ""
    @StateObject var moviePresenter: MoviePresenter<Any?, MovieModulePlayingModel, InteractorMovie<Any, [MovieModulePlayingModel], MovieModuleRepo<MovieLocaleDataSource, MovieRemoteDataSource, MovieModuleTransformer>>>
    var movieRouter: MovieRouter
    var body: some View {
        ZStack {
            Color("SecondaryColor")
            ScrollView(.vertical) {
                VStack(spacing: 5) {
                    BannerHome()
                        .frame(width: UIScreen.main.bounds.width, height: 180, alignment: .center)
                        .background(.black)
                    Text("Popular")
                        .font(.system(size: 14))
                        .padding(.leading, 10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
                        
                    ScrollView(.horizontal) {
                        if moviePresenter.isLoading {

                        } else if moviePresenter.list.isEmpty {

                        } else {
                            
                            HStack {
                                
                                ForEach(0..<self.moviePresenter.list.count ,content: { index in
                                    linkBuilder(for: self.moviePresenter.list[index], content: {
                                        CardItem(name: self.moviePresenter.list[index].title, image: "\(API.imageURL)\(self.moviePresenter.list[index].image)", rating: "\(self.moviePresenter.list[index].rating.removeZerosFromEnd())")
                                    })
                                })
                            }
                        }
                        
                    }.onAppear {
                        if self.moviePresenter.list.count == 0 {
                            print("aaaa")
                            self.moviePresenter.getPopular(request: nil, index: 0)
                        }
                    }
                    
                    Text("Now Playing")
                        .font(.system(size: 14))
                        .padding(.leading, 10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
                    
                        
                    ScrollView(.horizontal) {
                        if moviePresenter.isLoadingPlaying {

                        } else if moviePresenter.playing.isEmpty {

                        } else {
                            
                            HStack {
                                
                                ForEach(0..<self.moviePresenter.playing.count ,content: { index in
                                    linkBuilder(for: self.moviePresenter.playing[index], content: {
                                        CardItem(name: self.moviePresenter.playing[index].title, image: "\(API.imageURL)\(self.moviePresenter.playing[index].image)", rating: "\(self.moviePresenter.playing[index].rating.removeZerosFromEnd())")
                                    })
                                })
                            }
                        }
                    }.onAppear {
                        if self.moviePresenter.playing.count == 0 {
                            print("aaaa")
                            self.moviePresenter.getPlaying(request: nil, index: 1)
                        }
                    }
                   Spacer()
                    
                }
            }
            
           
        }.navigationTitle("\(type)")
            .background(Color("MainColor"))
            .onAppear {
                
            }
    }
}

extension MoviePage {
    func linkBuilder<Content: View>(
      for category: MovieModulePlayingModel,
      @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(
        destination: movieRouter.makeDetailView(model: category)) { content() }
    }
}

//struct MoviePage_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviePage()
//    }
//}
