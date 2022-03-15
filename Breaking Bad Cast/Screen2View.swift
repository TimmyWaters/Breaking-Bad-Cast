//
//  Screen2View.swift
//  Breaking Bad Cast
//
//  Created by Timothy Waters on 3/15/22.
//

import SwiftUI

struct Screen2View: View {
    var name = ViewModel().characters.first?.name
    var img = ViewModel().characters.first?.img
    //var occupation = ViewModel().characters.first!.occupation.
    var status = ViewModel().characters.first?.Status
    var nickname = ViewModel().characters.first?.nickname
    //var seasonAppearance = ViewModel().characters.first!.seasonAppearance
    
    var body: some View {
        VStack {
            //Text(name!)
            Image(img!)
            //Text(occupation)
            //Text(status!)
            //Text(nickname!)
            //Text(seasonAppearance)
        }
    }
}

struct Screen2View_Previews: PreviewProvider {
    static var previews: some View {
        Screen2View()
    }
}
