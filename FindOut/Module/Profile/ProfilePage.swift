//
//  ProfilePage.swift
//  FindOut
//
//  Created by Putra on 13/06/22.
//

import SwiftUI

struct ProfilePage: View {
    @State var index = 0
//    @StateObject var tabData = TabViewModel()
//    @StateObject var profileViewModel = ProfileViewModel()
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Color("SecondaryColor")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack(){
                    ZStack{
                        Color("MainColor")
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        VStack{
                            Image("fotogue")
                                .resizable()
                                .frame(width: geo.size.width/4, height: geo.size.width/4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                            Text("Agung Dwi Saputra")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .padding(.top,10)
                            
                            
                        }
                    }.frame(minWidth:0,maxWidth:.infinity, maxHeight:geo.size.height/3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.black)
                        Text("agungdwisaputra8@gmail.com")
                            .padding(.horizontal,5)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
