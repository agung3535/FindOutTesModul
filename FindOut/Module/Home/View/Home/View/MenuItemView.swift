//
//  MenuItem.swift
//  FindOut
//
//  Created by Putra on 08/06/22.
//

import SwiftUI

struct MenuItemView: View {
    var title: String = ""
    var icon: String = ""
    var body: some View {
        VStack {
                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
//                        .foregroundColor(.white)
                        
                    VStack {
                        ZStack {
                                Circle()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(Color("MainColor"))
                                Image(systemName: "\(icon)")
                                .foregroundColor(.white)
                        }
                        Text("\(title)")
                            .foregroundColor(Color("MainColor"))
                            .font(.system(size: 12))
                    }
                    .padding(.bottom, 5)
                }
            
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5))
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
    }
}
