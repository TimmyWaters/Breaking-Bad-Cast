//
//  ViewModel.swift
//  Breaking Bad Cast
//
//  Created by Timothy Waters on 3/15/22.
//
import SwiftUI
import Foundation

struct Character: Hashable, Codable{
    let name: String
    let img: String
}

class ViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetch(){
        guard let url = URL(string: "https://breakingbadapi.com/api/characters") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do{
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    self?.characters = characters
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
