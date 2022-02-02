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
    }
    
    // Table view methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here" // https://forums.raywenderlich.com/t/chapter-19-uitableviewcell-detailtextlabel-is-deprecated/132259
        return cell
    }
}

