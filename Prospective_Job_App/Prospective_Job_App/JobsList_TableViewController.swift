//
//  JobsList_TableViewController.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 3/27/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit
import CoreData

class JobsList_TableViewController: UITableViewController {
    
    var jobsArray : [NSManagedObject] = []
    
    func generateAndSaveArrayOfJobs() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Jobs", in: managedContext)!
        
        // Job 1
        var jobListing = NSManagedObject(entity: entity, insertInto: managedContext)
        jobListing.setValue("Front End Software Developer (REMOTE)", forKeyPath: "jobTitle")
        jobListing.setValue("We are building a team of developers with a breadth of combined experiences so that we can collaboratively build great products. There are no hard requirements on specific background, experience or geographical location. Instead we’re looking for individuals that are capable, reliable, and hoping to grow along with us. Do you have strengths you can share? If so, we’d love to hear from you!", forKeyPath: "jobDesc")
        jobListing.setValue("Computer Hardware & Software", forKeyPath: "industry")
        jobListing.setValue("$34,000", forKeyPath: "salary")
        jobListing.setValue("CRISP", forKeyPath: "companyName")
        jobsArray.insert(jobListing, at: 0)
        
        // Job 2
        jobListing = NSManagedObject(entity: entity, insertInto: managedContext)
        jobListing.setValue("Web Developer", forKeyPath: "jobTitle")
        jobListing.setValue("Santanna is looking for a Senior Web Developer who stays current on modern technologies and innovations, and willing to work to develop best performing and highly scalable websites, interactive pieces and mobile apps. This role will serve as the full-time Web Designer and Developer for both front and back end applications. The ideal candidate is a creative problem solver who will work in coordination with cross-functional teams to design, develop, and maintain our next-generation websites, web tools and mobile apps. You must be comfortable working as part of a team while taking the initiative to take lead on new innovations and projects.", forKeyPath: "jobDesc")
        jobListing.setValue("Energy", forKeyPath: "industry")
        jobListing.setValue("$95,000", forKeyPath: "salary")
        jobListing.setValue("Santanna Energy Services", forKeyPath: "companyName")
        jobsArray.insert(jobListing, at: 0)
        
        // Job 3
        jobListing = NSManagedObject(entity: entity, insertInto: managedContext)
        jobListing.setValue("UI Developer", forKeyPath: "jobTitle")
        jobListing.setValue("AS a UI Developer you will be responsible for building an engaging user experience focused on navigating data through out the Risk and Control Data Reservior. You will utilize mature (3rd or 4th Generation) programming methodologies and languages and adhere to coding standards, procedures and techniques while contributing to the technical code documentation.", forKeyPath: "jobDesc")
        jobListing.setValue("Investment Banking & Asset Management", forKeyPath: "industry")
        jobListing.setValue("$95,000", forKeyPath: "salary")
        jobListing.setValue("JPMorgan Chase & Co.", forKeyPath: "companyName")
        jobsArray.insert(jobListing, at: 0)
        
        // Job 4
        jobListing = NSManagedObject(entity: entity, insertInto: managedContext)
        jobListing.setValue("Front End Developer", forKeyPath: "jobTitle")
        jobListing.setValue("The Front End Developer will be responsible for the front end, customer-facing parts of our stack: implementing and optimizing UI components, as well as writing underlying code efficiently and with the objective to deliver a best-in-class user experience. The ideal candidate will work closely with the Digital Sales and Marketing teams and IT to understand the business objectives as it relates to online user experience and performance targets and implement elegant and robust code solutions to support those objectives. The Front End Developer will report to the Director of Digital Sales and Marketing, ensuring that the Just Energy portfolio of websites are updated per business requests, optimized per latest browser standards, and operating optimally. Responsibilities include, but are not limited to, intake of business requests and expedient execution, owning successful identification of site performance issues and driving to solution and execution, implementation of UI and content updates and thorough quality assurance testing throughout development process.", forKeyPath: "jobDesc")
        jobListing.setValue("Utilities", forKeyPath: "industry")
        jobListing.setValue("$50,000", forKeyPath: "salary")
        jobListing.setValue("Just Energy", forKeyPath: "companyName")
        jobsArray.insert(jobListing, at: 0)
        
        // Job 5
        jobListing = NSManagedObject(entity: entity, insertInto: managedContext)
        jobListing.setValue("Front End Developer/Engineer", forKeyPath: "jobTitle")
        jobListing.setValue("The Web Engineer is responsible for pushing the envelope in storytelling on behalf of our clients and innovating ways to engage readers on and off platform. You will execute key projects and feel comfortable contributing through all development phases including prototyping, troubleshooting and deployment. You will also work closely with interactive designers to bring branded content experiences to life. The Web Engineer is fluent enough to solve the gnarliest problems with engineers and be understood by non-technical clients.", forKeyPath: "jobDesc")
        jobListing.setValue("News Outlet", forKeyPath: "industry")
        jobListing.setValue("$130,000", forKeyPath: "salary")
        jobListing.setValue("New York Times", forKeyPath: "companyName")
        jobsArray.insert(jobListing, at: 0)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPaths=self.tableView!.indexPathsForSelectedRows!
        let indexPath = indexPaths[0] as NSIndexPath
        
        let jobInfoPage = segue.destination as? JobDesc_ViewController
        let job = jobsArray[indexPath.row]
        
        jobInfoPage?.indexNumber = indexPath.row
        
        jobInfoPage?.jTitle = (job as! Jobs).jobTitle!
        jobInfoPage?.jCompany = (job as! Jobs).companyName!
        jobInfoPage?.jDesc = (job as! Jobs).jobDesc!
        jobInfoPage?.jSalary = (job as! Jobs).salary!
        jobInfoPage?.jIndustry = (job as! Jobs).industry!
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
        
        return jobsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobsListItem", for: indexPath) as! JobCell
        
        let job = jobsArray[indexPath.row]
        cell.textLabel!.text = (job as! Jobs).jobTitle
        cell.subtitleLabel!.text = (job as! Jobs).companyName
        
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

        let fetchRequestJobs = NSFetchRequest<NSManagedObject>(entityName: "Jobs")

        //3: Now, do the actual fetch with the setup done.

        do {
            jobsArray = try managedContext.fetch(fetchRequestJobs)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if jobsArray.count == 0 {
            //deleteAll ()
            generateAndSaveArrayOfJobs()
        }
    }
    
    /*Did Select Cell in TableView*/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        print("You picked \(self.jobsArray[indexPath.row])")
        
        //let job = jobsArray[indexPath.row]
        
        //self.performSegue(withIdentifier: "JobDesc", sender: self)
        
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Jobs")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)

        do {
            try managedContext.execute(batchDeleteRequest)
        } catch {
            // Error Handling
        }
    }
   
}
