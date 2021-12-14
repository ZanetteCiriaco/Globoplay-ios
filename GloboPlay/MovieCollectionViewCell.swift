//
//  MovieCollectionViewCell.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 13/12/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    private var moviePosterImage: UIImageView!
    static let cellId = "MovieCollectionViewCell"
    
    var imageUrl: String? {
        didSet {
            setupMoviePosterImage()
        }
    }
    
    override init(frame: CGRect) {
          super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //hide or reset anything you want hereafter, for example
        moviePosterImage.isHidden = true
    }
    
    private func setupMoviePosterImage() {
        moviePosterImage = UIImageView()
        contentView.addSubview(moviePosterImage)
        
        moviePosterImage.loadImage(urlString: CONST.BASE_IMAGE_URL + (imageUrl ?? "")) {}
        moviePosterImage.contentMode = .scaleAspectFit
        moviePosterImage.clipsToBounds = true
        moviePosterImage.translatesAutoresizingMaskIntoConstraints = false
        
        moviePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        moviePosterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        moviePosterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        moviePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
