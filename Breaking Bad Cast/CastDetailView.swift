//
//  CastDetailView.swift
//  Breaking Bad Cast
//
//  Created by Timothy Waters on 3/15/22.
//

import SwiftUI

struct CastDetailView: View {
    var character: Character
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            URLImage(urlString: character.img, temp: "Photo")
                .frame(width: 300, height: 300)
                .scaledToFit()
                .padding()
            Spacer()
            HStack {
                Text("Name: ")
                    .bold()
                Text(character.name)
            }
            HStack(alignment: .top) {
                Text("Occupation: ")
                    .bold()
                VStack {
                    ForEach(character.occupation, id: \.self){ occupation in
                        VStack{
                            Text(occupation)
                        }
                    }
                }
            }
            HStack{
                Text("Status: ")
                    .bold()
                Text(character.status)
            }
            HStack{
                Text("Nickname: ")
                    .bold()
                Text(character.nickname)
            }
            HStack{
                Text("Season Appearance: ")
                    .bold()
                ForEach(character.appearance, id: \.self){ appearance in
                    VStack{
                        Text("\(appearance)")
                    }
                }
            }
            Spacer()
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(character: ViewModel().characters.first!)
    }
}
