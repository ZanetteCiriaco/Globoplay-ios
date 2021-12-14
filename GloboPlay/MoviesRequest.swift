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
        
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=8783aafa1330bbeebe9f3d063d8647cc&language=pt-BR") else {return}
        
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
}


