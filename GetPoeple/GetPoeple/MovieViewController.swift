//
//  MovieViewController.swift
//  GetPoeple
//
//  Created by Mohammed Alsiraji on 09/12/2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    //Title, Release Date, Director, Opening Crawl
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDataLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    @IBOutlet weak var openingCrawl: UILabel!
    
    var movieURl = String()
    var movie: FilmResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movieURl)
        
        StarWarsModel.getAMovie(movieUrl: movieURl, compoletionHandler: { data, response, error in
            guard let data = data else {return}
            do {
                let movieData = try JSONDecoder().decode(FilmResult.self, from: data)
                self.movie = movieData
                DispatchQueue.main.async {
                    self.getMovie()
                }
                
                
                print(movieData)
            }catch
            {
                print("error in person data \(error)")
            }
        })
        
        
        
    }
    
    func getMovie(){
        //Title, Release Date, Director, Opening Crawl
        titleLabel?.text = movie?.title
        releaseDataLabel?.text = movie?.releaseDate
        directorLabel?.text = movie?.director
        openingCrawl?.text = movie?.openingCrawl
        
        
        
        
    }

    
}
