//
//  ViewController.swift
//  GetPoeple
//
//  Created by Mohammed Alsiraji on 07/12/2022.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    var poepleTable: [Result] = []
    var nameData: Name?
    //  var nameData: Name!
    
    override func viewDidLoad() {
        
        self.tabBarItem.title = "Peolpe"
        super.viewDidLoad()

        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                guard let data = data else {return}
                
                let nameData = try JSONDecoder().decode(Name.self, from: data)
                self.poepleTable += nameData.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        poepleTable.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let names =  tableView.dequeueReusableCell(withIdentifier: "namesCell", for: indexPath)
        names.textLabel?.text = poepleTable[indexPath.row].name
        return names
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let personView = self.storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as? PersonViewController  else {
            print("No view Found")
            return
        }
        
        personView.personUrl = poepleTable[indexPath.row].url
        self.navigationController?.pushViewController(personView, animated: true)
    }
    
    
}

extension PeopleTableViewController{
//
//
//    func callingApi(next: String){
//        // we checke the new url is not null
//        // let jsonURLstring = next
//
//
//        guard let url = URL(string : next) else {return }
//
//        URLSession.shared.dataTask(with: url) { data , response, errur in
//            guard let data = data else {return }
//
//            do {
//                let nameData = try JSONDecoder().decode(Name.self, from: data)
//                self.poepleTable += nameData.results
//                if nameData.next != nil {
//                    self.callingApi(next: nameData.next!)
//                }
//                else {
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//
//                }
//
//            }catch{
//                print(error)
//            }
//
//        }.resume()
//
//
//
//    }
//
    
    
}


