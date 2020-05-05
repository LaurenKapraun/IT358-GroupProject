//
//  CompanyList_TableViewController.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 3/28/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit
import CoreData

class CompanyList_TableViewController: UITableViewController {
    
    var companiesArray : [NSManagedObject] = []
    
    func generateAndSaveArrayOfCompanies() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Companies", in: managedContext)!
        
        // Company 1
        var company = NSManagedObject(entity: entity, insertInto: managedContext)
        company.setValue("CRISP", forKeyPath: "company")
        company.setValue("Leeds, England", forKeyPath: "location")
        company.setValue("Crisp is the global authority on social media risk. Which means we remove a wide range of threats from our clients’ social channels, including profanities, scams, PR issues, grooming conversations, cyberbullying and much more.", forKeyPath: "aboutCompany")
        company.setValue("4.4", forKeyPath: "rating")
        companiesArray.insert(company, at: 0)
        
        // Company 2
        company = NSManagedObject(entity: entity, insertInto: managedContext)
        company.setValue("Santanna Energy Services", forKeyPath: "company")
        company.setValue("Austin, TX", forKeyPath: "location")
        company.setValue("Santanna Energy has provided low cost energy services to thousands of companies and residential customers for over 25 years. We recognize the public is seeking an energy provider that not only offers affordable energy but great customer service, which is why we strive to offer the best of both worlds. Santanna Energy specializes in offering affordable, top-notch services to both commercial small business customers and larger industrial customers who are tired of paying high commercial or industrial energy prices. Santanna Energy strives to provide every customer with the finest energy service possible.", forKeyPath: "aboutCompany")
        company.setValue("2.6", forKeyPath: "rating")
        companiesArray.insert(company, at: 0)
        
        // Company 3
        company = NSManagedObject(entity: entity, insertInto: managedContext)
        company.setValue("J.P. Morgan", forKeyPath: "company")
        company.setValue("New York, NY", forKeyPath: "location")
        company.setValue("J.P. Morgan helps businesses, markets and communities grow and develop in more than 100 countries. Through our Corporate and Investment Bank, we provide banking, markets and investor services, treasury services and more for the world's most important corporations, governments and institutions. Our Asset and Wealth Management business provides global market insights and a range of investment capabilities for individuals and families, advisors and institutions.", forKeyPath: "aboutCompany")
        company.setValue("3.9", forKeyPath: "rating")
        companiesArray.insert(company, at: 0)
        
        // Company 4
        company = NSManagedObject(entity: entity, insertInto: managedContext)
        company.setValue("Just Energy", forKeyPath: "company")
        company.setValue("Mississauga, ON (Canada)", forKeyPath: "location")
        company.setValue("Just Energy is a leading provider of natural gas, electricity and green energy. Established in 1997, and as a publicly traded company (NYSE:JE and TSX:JE), Just Energy serves more than 2 million customers across North America alone. With outreach now in Canada, the United Kingdom, Japan, Germany, and India, Just Energy is prepared to offer affordable power and gas to its consumers on an international level. Along with electricity and natural gas supply, Just Energy offers green energy product options and energy efficient programs that let customers support a cleaner environment.", forKeyPath: "aboutCompany")
        company.setValue("3.3", forKeyPath: "rating")
        companiesArray.insert(company, at: 0)
        
        // Company 5
        company = NSManagedObject(entity: entity, insertInto: managedContext)
        company.setValue("New York Times", forKeyPath: "company")
        company.setValue("New York, NY", forKeyPath: "location")
        company.setValue("The New York Times Company (The Times Co.) publishes The New York Times, one of the world's most respected newspapers boasting a circulation of about 900,000. It also owns The Boston Globe and the Worcester Telegram & Gazette (Massachusetts). Subsidiary International Herald Tribune, meanwhile, publishes its eponymous newspaper for English readers in 180 countries. The Times Co. distributes news online through NYTimes.com and other sites, and it owns online content portal About Group. Chairman Arthur Sulzberger and his family control the company through a trust.", forKeyPath: "aboutCompany")
        company.setValue("3.8", forKeyPath: "rating")
        companiesArray.insert(company, at: 0)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPaths=self.tableView!.indexPathsForSelectedRows!
        let indexPath = indexPaths[0] as NSIndexPath
        
        let companyInfoPage = segue.destination as? CompanyDesc_ViewController
        let company = companiesArray[indexPath.row]
        
        companyInfoPage?.indexNumber = indexPath.row
        
        companyInfoPage?.cName = (company as! Companies).company!
        companyInfoPage?.cLocation = (company as! Companies).location!
        companyInfoPage?.cAbout = (company as! Companies).aboutCompany!
        companyInfoPage?.cRating = (company as! Companies).rating!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return companiesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell", for: indexPath) as! CompanyCell
        
        let company = companiesArray[indexPath.row]
        cell.textLabel!.text = (company as! Companies).company
        cell.subtitleLabel!.text = (company as! Companies).location
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1: Get the appDelegate, and then the managed context via its persistentContainer

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2: Make a NSFetchRequest object with resultType NSManagedObject for each of the entities

        let fetchRequestCompanies = NSFetchRequest<NSManagedObject>(entityName: "Companies")

        //3: Now, do the actual fetch with the setup done.

        do {
            companiesArray = try managedContext.fetch(fetchRequestCompanies)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if companiesArray.count == 0 {
            //deleteAll ()
            generateAndSaveArrayOfCompanies()
        }
    }
    
    /*Did Select Cell in TableView*/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        print("You picked \(self.companiesArray[indexPath.row])")
        
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
    }
    
    func deleteAll () {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Companies")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)

        do {
            try managedContext.execute(batchDeleteRequest)
        } catch {
            // Error Handling
        }
    }
    

}
