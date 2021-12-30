//
//  MovieSpecViewController.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 23/12/21.
//

import UIKit

class MovieSpecViewController: UIViewController {
    
    private var datasheet: UILabel!
    private var infoStackView: UIStackView!
    private var movie: MovieDetail!

    
    init(movie: MovieDetail){
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .homeBackground
        
        setupDataSheet()
        setupInfoStackView()
    }
    
    private func setupDataSheet(){
        datasheet = UILabel()
        view.addSubview(datasheet)
        
        datasheet.text = "Ficha tecnica"
        datasheet.textColor = .white
        datasheet.font = .boldSystemFont(ofSize: 20)
        datasheet.translatesAutoresizingMaskIntoConstraints = false
        
        datasheet.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        datasheet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        //datasheet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
    }
    
    private func setupInfoStackView() {
        infoStackView = UIStackView()
        view.addSubview(infoStackView)
        
        infoStackView.axis = .vertical
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.alignment = .leading
        infoStackView.distribution = .fillProportionally
        infoStackView.spacing = 10
        
        infoStackView.topAnchor.constraint(equalTo: datasheet.bottomAnchor, constant: 20).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        //infoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let originalTitle = UILabel()
        infoStackView.addArrangedSubview(originalTitle)
        originalTitle.customLabel(label: "Titulo Original", value: self.movie.original_title)
        
        let genres = UILabel()
        infoStackView.addArrangedSubview(genres)
        genres.customLabel(label: "Generos", value: genres.genreFormatter(array: self.movie.genres))
                           //self.movie.genres.first?.name ?? " " )
        
        let runtime = UILabel()
        infoStackView.addArrangedSubview(runtime)
        runtime.customLabel(label: "Duraçao", value: runtime.timeFormatter(time: self.movie.runtime))
        
        let releaseDate = UILabel()
        infoStackView.addArrangedSubview(releaseDate)
        releaseDate.customLabel(label: "Lançamento", value: self.movie.release_date)
        
        let popularity = UILabel()
        infoStackView.addArrangedSubview(popularity)
        popularity.customLabel(label: "Popularidade", value: "\(self.movie.popularity)")
        
        let country = UILabel()
        infoStackView.addArrangedSubview(country)
        country.customLabel(label: "Pais", value: self.movie.production_countries.first?.name ?? " ")
        
        
        
        
    }

}



private extension UILabel{
    
    func customLabel(label: String, value: String) {
        
        self.textColor = UIColor(red: 133/255.0, green: 133/255.0, blue: 133/255.0, alpha: 1.0)
        self.font = .systemFont(ofSize: 16)
        
        let string = "\(label): \(value)"
        let attributedText = NSMutableAttributedString(string: string)
        attributedText.addAttribute(.font,
                                    value: UIFont.boldSystemFont(ofSize: 17),
                                    range: NSRange(location: 0, length: label.count))
        
        self.attributedText = attributedText
        
    }
    
    
    func timeFormatter(time: Int) -> String {
        let time = time
        var formattedTime: String
        
        if time >= 60 {
            let hour = time / 60
            let minutes = time % 60
            formattedTime = "\(hour)h \(minutes)m"
            
            return formattedTime
            
        } else {
            formattedTime = "\(time)m"
            
            return formattedTime
        }
    }
    
    
    func genreFormatter(array: [Genre]) -> String{
        
        var genreList: [String] = []
        
        for genre in array {
            genreList.append(genre.name)
        }
        
        let returnString = genreList.joined(separator: ", ")
        
        return returnString
    }
}
