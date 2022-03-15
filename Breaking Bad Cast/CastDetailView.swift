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
        VStack{
            URLImage(urlString: character.img)
            //Image(character.img)
            Text(character.name)
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(character: ViewModel().characters.first!)
    }
}
