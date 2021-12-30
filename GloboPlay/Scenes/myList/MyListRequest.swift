//
//  myListRequest.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 29/12/21.
//

import Foundation

struct MyListRequest {
    
    func getUserList(completion: @escaping(Mylist) -> Void) {
        let urlString = "https://api.themoviedb.org/4/list/8173428?page=1&api_key=8783aafa1330bbeebe9f3d063d8647cc"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(CONST.ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                
                do {
                    let myList = try JSONDecoder().decode(Mylist.self, from: data)
                    DispatchQueue.main.async {
                        completion(myList)
                    }
                    
                } catch  {
                    print("falha ao converter json")
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
            
    }
}
