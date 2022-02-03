//
//  ViewController.swift
//  Project7 - Whitehouse Petitions
//
//  Created by John Kim on 2/2/22.
//

import UIKit

class ViewController: UITableViewController {
    
//    var petitions = [String]()
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // We're OK to parse!
                parse(json: data)
            }
        }
    }
    
    // Method
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    // Table view methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        /*
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here" // https://forums.raywenderlich.com/t/chapter-19-uitableviewcell-detailtextlabel-is-deprecated/132259
        */
        return cell
    }
}

