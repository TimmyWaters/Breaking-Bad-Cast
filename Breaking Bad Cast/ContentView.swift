//
//  ContentView.swift
//  Breaking Bad Cast
//
//  Created by Timothy Waters on 3/15/22.
//

import SwiftUI

struct URLImage: View{
    let urlString: String
    
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFit()
        }
        else{
            Image(systemName: "image")
                .resizable()
                .scaledToFit()
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.characters, id: \.self){ character in
                    NavigationLink(destination: CastDetailView(character: character), label:{
                        HStack{
                            URLImage(urlString: character.img)
                                .scaledToFit()
                                .frame(width: 130, height: 100)
                            Text(character.name)
                                .bold()
                        }
                    })
                }
            }
            .navigationTitle("Breaking Bad Cast")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
