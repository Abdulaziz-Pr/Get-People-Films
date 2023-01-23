//
//  FilmsTableViewController.swift
//  GetPoeple
//
//  Created by Mohammed Alsiraji on 07/12/2022.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    
    var allFilms: Films?
    var filmsTitles: [FilmResult] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // guard let url = URL(string : "https://swapi.dev/api/films/?format=json") else {return }
        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                guard let data = data else {return}
                
                let nameData = try JSONDecoder().decode(Films.self, from: data)
                self.filmsTitles = nameData.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
        
            
            
        
        
        
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmsTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")!
        
        cell.textLabel?.text = filmsTitles[indexPath.row].title
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieView = self.storyboard?.instantiateViewController(withIdentifier: "MovieViewController") as? MovieViewController else{
            print("no View Found!!")
            return
        }
        movieView.movieURl = filmsTitles[indexPath.row].url
        self.navigationController?.pushViewController(movieView, animated: true)
        
       
    }
    
    
    
}
