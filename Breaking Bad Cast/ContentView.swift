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
    var temp: String
    
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
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            List{
                ForEach(searchResults, id: \.self){ character in
                    NavigationLink(destination: CastDetailView(character: character), label:{
                        HStack{
                            URLImage(urlString: character.img, temp: "Photo")
                                .scaledToFit()
                                .frame(width: 130, height: 100)
                                .cornerRadius(75)
                            Text(character.name)
                                .bold()
                        }
                    })
                }
            }
            .searchable(text: $searchText, prompt: "Search for a character")
            .toolbar{
                ToolbarItem(placement: .principal){
                    HStack {
                        Image("bblogo")
                            .resizable()
                            .scaledToFit()
                        Text("Cast")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.323, green: 0.523, blue: 0.27))
                    }
                }
            }
            .onAppear{
                viewModel.fetch()
            }
        }
    }
    
    var searchResults: [Character]{
        if searchText.isEmpty{
            return viewModel.characters
        }
        else{
            return results()
        }
    }
    
    func results() -> [Character]{
        var names: [Character] = []
        //var temp: [String] = []
        //var tempStr: String

        for item in viewModel.characters{
            if !item.name.filter({ _ in item.name.contains(searchText) }).isEmpty {
                names.append(item)
            }
            
        }
        return names
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
