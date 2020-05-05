//
//  CompanyDesc_ViewController.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 5/5/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit
import CoreData

class CompanyDesc_ViewController: UIViewController {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyLocation: UILabel!
    @IBOutlet weak var companyAbout: UILabel!
    @IBOutlet weak var companyRating: UILabel!
    
    var companiesArray : [NSManagedObject] = []
    var indexNumber:Int?
    
    var cName = ""
    var cLocation = ""
    var cAbout = ""
    var cRating = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        companyName.text = cName
        companyLocation.text = cLocation
        companyAbout.text = cAbout
        companyRating.text = cRating
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
    }
    

}
