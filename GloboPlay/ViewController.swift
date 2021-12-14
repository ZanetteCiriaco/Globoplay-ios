//
//  ViewController.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 09/12/21.
//

import UIKit


class ViewController: UIViewController {
    
    
    private var request = MoviesRequest()
    var genres = [] as [Genre]
    private var table: UITableView!
    
    private var movieCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Globoplay"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        //navigationItem.largeTitleDisplayMode = .never
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = .black
        //view.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
    
        request.getMoviesGenresRequest { Genres in
            self.genres = Genres.genres
            //self.table.reloadData()
            self.setupTable()
            
        }
    
    }
    
    
    
    private func setupTable() {
        table = UITableView()
        view.addSubview(table)
        
        table.delegate = self
        table.dataSource = self
        table.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.reuseId)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        //table.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
        
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
        

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.genres.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.reuseId, for: indexPath) as! MoviesTableViewCell
        
        cell.genreId = self.genres[indexPath.section].id
        cell.genreName = self.genres[indexPath.section].name
        //cell.genreObject = self.genres[indexPath.section]
        cell.parent = self
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sectionName = self.genres[section].name
        
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    
}

