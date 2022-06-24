//
//  CardItem.swift
//  FindOut
//
//  Created by Putra on 09/06/22.
//

import SwiftUI
import Kingfisher

struct CardItem: View {
    @State var name: String
    @State var image: String
    @State var rating: String
    var body: some View {
        VStack {
            KFImage(URL(string: image))
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            Text("\(name)")
                .font(.system(size: 12))
                .foregroundColor(.black)
                .lineLimit(1)
                .frame(width: UIScreen.main.bounds.size.width / 3, alignment: .leading)
                .padding(.leading, 10)
                
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .padding(.leading, 5)
                Text("\(rating)")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    
            }
            .frame(width: UIScreen.main.bounds.size.width / 3, alignment: .leading)
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.size.width / 2.5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//struct CardItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CardItem()
//    }
//}
