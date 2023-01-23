//
//  PersonViewController.swift
//  GetPoeple
//
//  Created by Mohammed Alsiraji on 09/12/2022.
//

import UIKit

class PersonViewController: UIViewController {
    
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personGender: UILabel!
    
    @IBOutlet weak var personBearthYear: UILabel!
    
    @IBOutlet weak var personMass: UILabel!
    
    @IBOutlet weak var personSpecies: UILabel!
    
    
    
    
    
    
    
    
    
    var speciyName: String?
    var personUrl = String()
    var person: Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(personUrl)
        StarWarsModel.getAPerson(personUrl: personUrl, compoletionHandler: {
            data, response, error in
            guard let data = data else {return}
            do {
                let personData:Result  = try JSONDecoder().decode(Result.self, from: data)
                self.person = personData
                DispatchQueue.main.async {
                    self.setPersonData()
                    
                }
                
                
                print(personData)
            }catch
            {
                print("error in person data \(error)")
            }
            
        })
        
    }
    
    
    
    private func setPersonData(){
        personName.text = "Name: "+(person?.name ?? "N/A")
        personGender.text = "Gender: "+(person?.gender.rawValue ?? "N/A")
        personMass.text = "Mass: "+(person?.mass ?? "N/A")
        personBearthYear.text = "BirthYear: "+(person?.birthYear ?? "N/A")
        personSpecies.text = "N/A"
        
    }
    
    
    
}
