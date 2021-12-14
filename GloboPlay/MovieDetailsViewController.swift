//
//  MovieDetailsViewController.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 13/12/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    private var moviesRequest = MoviesRequest()
    private var movieId: Int!
    private var movie: MovieDetail!
    
    private var scrollView: UIScrollView!
    private var moviePosterImage: UIImageView!
    private var movieNameLabel: UILabel!
    private var movieGenreLabel: UILabel!
    private var movieOverviewLabel: UILabel!
    
    private var VstackView: UIStackView!
    private var buttonStackView: UIStackView!
    
    
    init(movieId: Int){
        self.movieId = movieId
        //self.genre = genre
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        
        moviesRequest.getMovieDetails(movieId: movieId) { movie in
            self.movie = movie
            self.setupScrollView()
            self.setupMoviePosterImage()
            self.setupMovieName()
            self.setupMovieGenre()
            self.setupMovieOverview()
            self.setupButtonStackView()
            self.setupVstackView()
        }
        
    
    }
    
    private func setupScrollView(){
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 800)
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.bounces = true
        scrollView.showsHorizontalScrollIndicator = true
        
    }
    
    private func setupMoviePosterImage(){
        moviePosterImage = UIImageView()
        scrollView.addSubview(moviePosterImage)
        
        moviePosterImage.translatesAutoresizingMaskIntoConstraints = false
        
        moviePosterImage.loadImage(urlString: CONST.BASE_IMAGE_URL + self.movie.poster_path) {}
        moviePosterImage.contentMode = .scaleAspectFit
        
        moviePosterImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        moviePosterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moviePosterImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    private func setupMovieName(){
        movieNameLabel = UILabel()
        scrollView.addSubview(movieNameLabel)
        
        movieNameLabel.text = movie.title
        movieNameLabel.font = .boldSystemFont(ofSize: 26)
        movieNameLabel.textColor = .white
        movieNameLabel.textAlignment = .center
        movieNameLabel.lineBreakMode = .byWordWrapping
        movieNameLabel.numberOfLines = 0
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieNameLabel.topAnchor.constraint(equalTo: moviePosterImage.bottomAnchor, constant: 20).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    }
    
    private func setupMovieGenre(){
        movieGenreLabel = UILabel()
        scrollView.addSubview(movieGenreLabel)
        
        movieGenreLabel.text = movie.genres[0].name
        movieGenreLabel.font = .systemFont(ofSize: 18)
        movieGenreLabel.textColor = .lightGray
        
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieGenreLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 20).isActive = true
        movieGenreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupMovieOverview() {
        movieOverviewLabel = UILabel()
        scrollView.addSubview(movieOverviewLabel)
        
        movieOverviewLabel.text = movie.overview
        movieOverviewLabel.font = .systemFont(ofSize: 20)
        movieOverviewLabel.textColor = .white
        movieOverviewLabel.textAlignment = .left
        movieOverviewLabel.numberOfLines = 0
        movieOverviewLabel.lineBreakMode = .byWordWrapping
        
        movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieOverviewLabel.topAnchor.constraint(equalTo: movieGenreLabel.bottomAnchor, constant: 20).isActive = true
        movieOverviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        movieOverviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setupButtonStackView() {
        buttonStackView = UIStackView()
        scrollView.addSubview(buttonStackView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        buttonStackView.topAnchor.constraint(equalTo: movieOverviewLabel.bottomAnchor, constant: 20).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let watch = UIButton()
        buttonStackView.addArrangedSubview(watch)
        
        watch.backgroundColor = .white
        watch.setTitleColor(.black, for: .normal)
        watch.setTitle("Assista", for: .normal)
        watch.layer.cornerRadius = 10
        watch.setImage(UIImage(named: "play_arrow"), for: .normal)
        watch.translatesAutoresizingMaskIntoConstraints = false
        watch.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        let myList = UIButton()
        buttonStackView.addArrangedSubview(myList)
        
        myList.backgroundColor = .black
        myList.setTitleColor(.white, for: .normal)
        myList.setTitle("Minha lista", for: .normal)
        let img = UIImage(named: "star_18")
        let tintedImg = img?.withTintColor(.white)
        myList.tintColor = .white
        myList.setImage(tintedImg, for: .normal)
        myList.layer.borderColor = CGColor.init(red: 0.50, green: 0.50, blue: 0.50, alpha: 1)
        myList.layer.borderWidth = 1.0
        myList.layer.cornerRadius = 10
        myList.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func setupVstackView() {
        VstackView = UIStackView()
        scrollView.addSubview(VstackView)

        VstackView.translatesAutoresizingMaskIntoConstraints = false
        VstackView.axis = .vertical
        VstackView.distribution = .fillProportionally
        VstackView.spacing = 15

        VstackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20).isActive = true
        VstackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        VstackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20).isActive = true

        let title = UILabel()
        title.text = "Titulo Original: "
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = .gray

        VstackView.addArrangedSubview(title)


        let genre = UILabel()
        genre.text = "Genero: "
        genre.font = .boldSystemFont(ofSize: 20)
        genre.textColor = .gray

        VstackView.addArrangedSubview(genre)
        
        
        let date = UILabel()
        date.text = "Data de lancamento: "
        date.font = .boldSystemFont(ofSize: 20)
        date.textColor = .gray
        
        VstackView.addArrangedSubview(date)
        
    
    }
    

}

extension UIImageView {
    func loadImage(urlString: String, completion: @escaping() -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion()
                    
                    }
                }
            }
        }
    }
}
