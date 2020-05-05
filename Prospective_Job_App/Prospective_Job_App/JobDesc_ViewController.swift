//
//  JobDesc_ViewController.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 5/4/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit
import CoreData

class JobDesc_ViewController: UIViewController {

    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var industry: UILabel!
    
    var jobsArray : [NSManagedObject] = []
    var indexNumber:Int?
    
    var jTitle = ""
    var jCompany = ""
    var jDesc = ""
    var jSalary = ""
    var jIndustry = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobTitle.text = jTitle
        companyName.text = jCompany
        jobDescription.text = jDesc
        salary.text = jSalary
        industry.text = jIndustry
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
    }
}
