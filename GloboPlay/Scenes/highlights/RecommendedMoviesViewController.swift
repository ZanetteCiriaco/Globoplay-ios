//
//  RecommendedMoviesViewController.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 23/12/21.
//

import UIKit

class RecommendedMoviesViewController: UIViewController {
    
    var collection: UICollectionView!
    private var request = MoviesRequest()
    private var recommendations = [] as [Movie]
    private var movieId: Int!
    
    
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
    
        
        request.getRecommendations(movieID: movieId) { recommendations in
            
            self.recommendations = recommendations.results
            self.setupCollection()
        }
        
        
    }
    
    
    private func setupCollection () {
        
        let Layout = UICollectionViewFlowLayout()
        Layout.itemSize = CGSize(width: view.frame.size.width * 0.275, height: view.frame.size.width * 0.47)
    
        collection = UICollectionView(frame: self.view.frame, collectionViewLayout: Layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .homeBackground
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.cellId)
        
        view.addSubview(collection)
        
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive =  true
    }
    

}

extension RecommendedMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if recommendations.count > 6 {
            return 6
            
        } else {
            return recommendations.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellId, for: indexPath) as! MovieCollectionViewCell
        
        cell.imageUrl = recommendations[indexPath.row].poster_path
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let Id = recommendations[indexPath.row].id
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(MovieDetailsViewController(movieId: Id), animated: true)
        
        
    }
    
    
}
