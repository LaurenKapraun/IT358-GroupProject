//
//  JobsList_TableViewController.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 3/27/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit

class JobsList_TableViewController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searching = false
    
    // Labels from Job Item View Controller
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var companyRatingLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    
    var jobs = [Job]()
    var filteredJobs: [Job]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        filteredJobs = jobs
        tableView.reloadData()
        
        let dolr = DOLRequest(method: "get", table: "accident")
        dolr.query(key: "limit", val: "10")
        dolr.query(key: "offset", val: "10")
        print(dolr.url_str!)
        dolr.call()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filteredJobs = jobs
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching {
            return filteredJobs?.count ?? 0
        }
        return filteredJobs?.count ?? jobs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobCell
        let job = filteredJobs?[indexPath.row] ?? jobs[indexPath.row]
        cell.job = job
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //SEARCH: - Searching
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredJobs = jobs
            searching = false
            return
        }
            // filter method takes a closure and returns a result that satisfies the criteria
        filteredJobs = jobs.filter { job in
            return job.title.lowercased().contains(searchText.lowercased()) || job.subtitle.contains(searchText.lowercased()) || job.company.title.lowercased().contains(searchText.lowercased())
        }
        let count = filteredJobs?.count ?? 0
        searching = count == 0 ? false : true
        print("Jobs: Filtered \(count)")
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searching = false
    }
}
