//
//  ViewController.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.
//

import UIKit
import SwiftUI

class MoviesTableViewController: UITableViewController {
    
    private var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateMovies()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = self.movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
        
        cell.textLabel?.text = movie.title
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: URL(string: movie.poster)!)
            if let imageData = imageData {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                }
            }
        }
        
        return cell
    }
    
    @IBSegueAction func showMoviesDetails(_ coder: NSCoder) -> UIViewController? {
        guard let selectedIndex = tableView.indexPathForSelectedRow else {
             assertionFailure("No Index Found")
            return UIViewController()
        }
        let view = MovieDetailsView(movie: movies[selectedIndex.row])
        return UIHostingController(coder: coder, rootView: view)
    }
    
    private func populateMovies() {
        
        let url = "http://www.omdbapi.com/?s=batman&apikey=564727fa"
        
        Webservice().loadMovies(url: url) { movies in
            
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
            
        }
        
    }
    
}

