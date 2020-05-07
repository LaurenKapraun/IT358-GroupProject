//
//  TurnoverTableViewController.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 5/6/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit

class TurnoverTableViewController: UITableViewController, UISearchResultsUpdating {

    var industries = [String]()
    var turnovers = [Series]()
    var currentTask: URLSessionDataTask?
    let searchController = UISearchController(searchResultsController: nil)
    //var searching = true
    var searchText = "a"
    
    override func viewDidLoad() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        //searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        super.viewDidLoad()
        requestIndustryTurnovers(searchText: searchText)
        //self.clearsSelectionOnViewWillAppear = false
        //tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            print("SearchText: \(searchText)")
            requestIndustryTurnovers(searchText: searchText)
        } else {
            turnovers = [Series]()
        }
        //tableView.reloadData()
        
        for s in turnovers {
            print(s)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return turnovers.count
    }

    func requestIndustryTurnovers(searchText: String){
        print("Sent Request")
        var strings = [String]()
        let industries = industryCodeDic_d6.searchDicKeys(str: searchText, verbatem: false, limit: 6)
        
        let array = SeriesArray.JobOpeningsLaborTurnoverSurvey(adjs: AdjCode.allCases, ind6s: industries.valuesAsStrings(), regs: Region.allCases, dels: TurnoverElem.allCases, rlvs: RateLev.allCases).array
        print(array)
        for a in array {
            for (i,c) in industries {
                if (c as! String) == a.industry {
                    strings.append(i)
                }
            }
        }
        self.industries = strings
        
        let request = BLSRequest(method: "post", path: "timeseries/data")
        request.batch.append(seriesArray: array)
        print(request.batch.codes)
        
            //create and send task
        guard let req = request.request else {return}
        
        let task = request.session.dataTask(with: req as URLRequest,
        completionHandler: {
            data, response, error in
            guard error == nil else {
                print("error calling GET method")
                print(error!)
                return
            }
            guard let respData = data else {
                print("Error: did not receive data")
                return
            }
            print(String(decoding: respData, as: UTF8.self))
            do {
                //print(data.description)
                let objects = try JSONDecoder().decode(RequestResponse.self, from: respData)
                //self.response = response
                print(objects)
                print("added turnovers")
                self.turnovers = objects.results.series
                DispatchQueue.main.async() {
                    self.tableView.reloadData()
                    print("data reloaded")
                }
            }
            catch  {
                print("error trying to convert data to JSON")
                return
            }
        })
        task.resume()
        currentTask = task
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "turnoverCell", for: indexPath) as? TurnoverCell else {
                fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        if indexPath.row < min(turnovers.count, industries.count){
            cell.turnover = self.turnovers[indexPath.row]
            cell.indName = self.industries[indexPath.row]
        }
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let task = currentTask {
            if task.state == .running {
                task.cancel()
            }
        }
        guard let searchText = searchController.searchBar.text else { return }
        requestIndustryTurnovers(searchText: searchText)
        //searching = false
        let count = turnovers.count
        //searching = count == 0 ? false : true
        print("Industries: Filtered \(count)")
        //tableView.reloadData()*/
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //searching = true
        if let task = currentTask {
            if task.state == .running {
                task.cancel()
            }
        }
        guard let searchText = searchController.searchBar.text else { return }
        requestIndustryTurnovers(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //searching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchController.searchBar.text else { return }
        requestIndustryTurnovers(searchText: searchText)
    }
}


