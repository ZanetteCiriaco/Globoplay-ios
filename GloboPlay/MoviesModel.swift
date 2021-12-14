//
//  Model.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 12/12/21.
//

import Foundation


// MARK: - Welcome
struct Genres: Decodable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Decodable{
    let id: Int
    let name: String
}



// movies

struct Movie: Decodable {
    let id: Int
    //let original_title: String
    //let overview: String
    let poster_path: String
    //let release_date: String
    //let title: String
}

struct Root: Decodable {
    let results: [Movie]
}





// MARK: - Welcome
struct MovieDetail: Decodable {
    //let adult: Bool
    //let backdropPath: String
    //let belongsToCollection: NSNull
    //let budget: Int
    let genres: [Genre]
    //let homepage: String
    let id: Int
    //let imdbID,
    //let originalLanguage,
    let original_title: String
    let overview: String
    //let popularitty: Double
    let poster_path: String
    //let productionCompanies: [ProductionCompany]
    //let productionCountries: [ProductionCountry]
    //let releaseDate: String
    //let revenue, runtime: Int
    //let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    //let video: Bool
    //let voteAverage, voteCount: Int
}
//
//// MARK: - ProductionCompany
//struct ProductionCompany {
//    let id: Int
//    let logoPath: NSNull
//    let name, originCountry: String
//}
//
//// MARK: - ProductionCountry
//struct ProductionCountry: Decodable {
//    //let iso3166_1
//    let name: String
//}
//
//// MARK: - SpokenLanguage
//struct SpokenLanguage {
//    let englishName, iso639_1, name: String
//}
