////
////  NavigationTabBar.swift
////  FindOut
////
////  Created by Putra on 16/06/22.
////
//
//import SwiftUI
//import CoreFindOut
//import HomeOut
//
//struct NavigationTabBar: View {
//    @StateObject var tabData = TabViewModel()
//    
////    init() {
////        UITabBar.appearance().isHidden = true
////    }
//    
//    @Namespace var animation
//    @ObservedObject var homePresenter: GetListPresenter<Any?, HomePlayingModel, InteractorCore<Any, [HomePlayingModel], HomeModuleMovieRepo<HomeMovieLocaleDataSource, HomeRemoteDataSource, HomeMovieTransformer>>>
//    
//    var body: some View {
//        
//        GeometryReader{geo in
//            TabView(selection: $tabData.currentTab) {
//                HomePage(homePresenter: homePresenter, homeRouter: <#HomeRouter#>)
//                    .environmentObject(tabData)
//                    .tag("Home")
//                ProfilePage()
//                    .environmentObject(tabData)
//                    .tag("Profile")
//            }.overlay(
//                HStack{
//                    TabBarButton(title: "Home", image: "house", animation: animation)
//                    TabBarButton(title: "Profile", image: "person", animation: animation)
//                }
//                
//                .environmentObject(tabData)
//                .padding(.vertical,geo.size.height/120)
//                .padding(.horizontal)
//                .background(Color("MainColor"))
//                .cornerRadius(25)
//                .padding(.horizontal,geo.size.width/15)
//                .padding(.bottom,geo.size.height/120)
//                ,
//            alignment: .bottom
//            )
//        }
//    }
//}
//
////struct NavigationTabBar_Previews: PreviewProvider {
////    static var previews: some View {
////        NavigationTabBar()
////    }
////}
//
//struct TabBarButton : View {
//    var title: String
//    var image : String
//    
//    var animation : Namespace.ID
//    @EnvironmentObject var tabData : TabViewModel
//    
//    var body: some View {
//        
//        GeometryReader{ geo in
//            Button(action: {
//                withAnimation{
//                    tabData.currentTab = title
//                }
//            }) {
//                VStack{
//                    Image(systemName: image)
//                        .font(.title2)
//                    Text(title)
//                        .font(.caption)
//                }
//                .foregroundColor(tabData.currentTab == title ? Color("TintColor") : .gray)
//                .frame(maxWidth:.infinity)
//
//            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//
//        }.frame(height: 40)
//    
//    }
//    
//}
