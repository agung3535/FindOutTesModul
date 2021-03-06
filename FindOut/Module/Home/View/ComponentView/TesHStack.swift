//
//  TesHStack.swift
//  FindOut
//
//  Created by Putra on 09/06/22.
//

import SwiftUI

extension UIView {
    var globalFrame: CGRect? {
        let rootView = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view
        return self.superview?.convert(self.frame, to: rootView)
    }
}

struct Movie: Hashable {
    let title, imageName: String
}

struct ContentViewNew: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    let topMovies: [Movie] = [
        .init(title: "atlantica", imageName: "atlantica"),
        .init(title: "Avatar", imageName: "atlantica"),
        .init(title: "Captain Marvel", imageName: "atlantica"),
        .init(title: "Soul", imageName: "atlantica"),
        .init(title: "Tenet", imageName: "atlantica"),
        .init(title: "Avengers: Endgame", imageName: "atlantica"),
    ]
    
    let animationMovies: [Movie] = [
        .init(title: "Soul", imageName: "soul"),
        .init(title: "Tenet", imageName: "tenet"),
        .init(title: "Avengers: Endgame", imageName: "avengers"),
        .init(title: "Captain Marvel", imageName: "captain_marvel")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                MoviesCarousel(categoryName: "Top Movies of 2020", movies: topMovies)
                MoviesCarousel(categoryName: "Animated Movies", movies: animationMovies)
                MoviesCarousel(categoryName: "Top Movies of 2020", movies: topMovies)
                MoviesCarousel(categoryName: "Animated Movies", movies: animationMovies)
            }.navigationBarTitle("Movies of the Century", displayMode: .large)
            
        }
    }
}

struct MoviesCarousel: View {
    
    let categoryName: String
    let movies: [Movie]
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
//        guard let rootView = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view else { return 1}
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
    
    var body: some View {
        HStack {
            Text(categoryName)
                .font(.system(size: 14, weight: .heavy))
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(2)
            Spacer()
        }.padding(.horizontal)
        .padding(.top)
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(movies, id: \.self, content: { num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        VStack(spacing: 8) {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180)
                                .clipped()
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(white: 0.4))
                                )
                                .shadow(radius: 3)
                            Text("Dummy")
                                .font(.system(size: 16, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            HStack(spacing: 0) {
                                ForEach(0..<5) { num in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.orange)
                                        .font(.system(size: 14))
                                }
                            }.padding(.top, -4)
                        }
                        
                            .scaleEffect(.init(width: scale, height: scale))
//                            .animation(.spring(), value: 1)
                            .animation(.easeOut(duration: 1))
                            
                            .padding(.vertical)
                    }
                    .frame(width: 125, height: 400)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)

                })
            }
        }
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(alignment: .top, spacing: 16) {
//                ForEach(movies, id: \.self) { num in
//                    GeometryReader { proxy in
//                        let scale = getScale(proxy: proxy)
//                        NavigationLink(
//                            destination: MovieDetailsView(movie: num),
//                            label: {
//                                VStack(spacing: 8) {
//                                    Image(num.imageName)
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 180)
//                                        .clipped()
//                                        .cornerRadius(8)
//                                        .overlay(
//                                            RoundedRectangle(cornerRadius: 8)
//                                                .stroke(Color(white: 0.4))
//                                        )
//                                        .shadow(radius: 3)
//                                    Text(num.title)
//                                        .font(.system(size: 16, weight: .semibold))
//                                        .multilineTextAlignment(.center)
//                                        .foregroundColor(.black)
//                                    HStack(spacing: 0) {
//                                        ForEach(0..<5) { num in
//                                            Image(systemName: "star.fill")
//                                                .foregroundColor(.orange)
//                                                .font(.system(size: 14))
//                                        }
//                                    }.padding(.top, -4)
//                                }
//                            })
//
//                            .scaleEffect(.init(width: scale, height: scale))
////                            .animation(.spring(), value: 1)
//                            .animation(.easeOut(duration: 1))
//
//                            .padding(.vertical)
//                    }
//                    .frame(width: 125, height: 400)
//                    .padding(.horizontal, 32)
//                    .padding(.vertical, 32)
//                }
//                Spacer()
//                    .frame(width: 16)
//            }
//        }
    }
}

struct MovieDetailsView: View {
    
    let movie: Movie
    
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFill()
            .navigationTitle(movie.title)
    }
}

struct TesHStack_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNew()
    }
}

