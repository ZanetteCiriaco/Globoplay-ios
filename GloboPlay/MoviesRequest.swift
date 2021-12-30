//
//  MovieGenresRequest.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 12/12/21.
//

import Foundation


struct MoviesRequest {
    
    
    // MARK: RECUPERAR VARIOS FILMES REFERENTE A X GENERO
    func getMoviesByGenresRequest(with_genre: Int, completion: @escaping (Root) -> Void){
        let withGenre = String(with_genre)
        
        guard let url = URL(string: CONST.BASE_URL + CONST.DISCOVER + CONST.API_KEY + CONST.LANGUAGE_BR + CONST.POPULARITY + CONST.PAGE + withGenre) else { return }
        
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if error == nil {
                guard let data = data else { return }
                
                do {
                    let moviesData:Root = try JSONDecoder().decode(Root.self, from: data)
                    DispatchQueue.main.async {
                        completion(moviesData)
                    }
                   
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
    
    // MARK: RECUPERAR ARRAY DE GENEROS
    func getMoviesGenresRequest (completion: @escaping(Genres) -> Void) {
        
        guard let url = URL(string: CONST.BASE_URL + CONST.GENRE + CONST.API_KEY + CONST.LANGUAGE_BR) else { return }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if error == nil {
                guard let data = data else { return }
                
                do {
                    let genres = try JSONDecoder().decode(Genres.self, from: data)
                    DispatchQueue.main.async {
                        completion(genres)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
        
    }
    
    //MARK: RECUPERAR DETALHES DE UM FILME
    func getMovieDetails(movieId: Int, completion: @escaping (MovieDetail) -> Void) {
        let id = String(movieId)
        

        guard let url = URL(string: CONST.BASE_URL + CONST.MOVIE + id + CONST.API_KEY + CONST.LANGUAGE_BR) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                
                do {
                    let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                    DispatchQueue.main.async {
                        completion(movieDetail)
                    }
                } catch  {
                    print("falhou converter")//error.localizedDescription)
                }
            } else {
                print(error!.localizedDescription)
            }
            
        }.resume()
    }
    
    
    // MARK: RECUPERAR RECOMENDACOES PARA UM FILME
    func getRecommendations(movieID: Int, completion: @escaping(Root) -> Void) {
        let movieID = String(movieID)
        
        guard let url = URL(string: CONST.BASE_URL + CONST.MOVIE + movieID + CONST.RECOMMENDATIONS + CONST.API_KEY + CONST.LANGUAGE_BR) else { return }
    
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil {
                guard let data = data else { return }
                
                do {
                    let recommendations = try JSONDecoder().decode(Root.self, from: data)
                    DispatchQueue.main.async {
                        completion(recommendations)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print(error!.localizedDescription)
            }
            
        }.resume()
        
    }
    
    
    // MARK: ADICIONAR FILMES A LISTA
    func addMovieToList(movieId: Int, completion: @escaping(Int) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/4/list/8173428/items") else { return }
        var request = URLRequest(url: url)
        
        let listData = listData(media_type: "movie", media_id: movieId)
        let jsonObject = Items(items: [listData])
        
        do {
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(CONST.ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
            
            request.httpBody = try JSONEncoder().encode(jsonObject)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
              
                let res = response as? HTTPURLResponse
                    
                DispatchQueue.main.async {
                    
                    if(error == nil) {
                        completion(res!.statusCode)
                    } else {
                        completion(440)
                    }
                    
                }
                    
               
            }.resume()
            
        } catch {
            print(error.localizedDescription)
        }
          
    }
}



