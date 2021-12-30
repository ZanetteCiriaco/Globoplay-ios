//
//  Extensions.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 22/12/21.
//

import Foundation
import UIKit


// background Color

extension UIColor {
    static let homeBackground = UIColor(red: 31/255.0, green: 31/255.0, blue: 31/255.0, alpha: 1.0)
}


// Load image from url

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
