//
//  ListTableViewController.swift
//  LoadDataFromPlist
//
//  Created by Vũ on 3/21/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var tableData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let path = Bundle.main.path(forResource: "Districts", ofType: "plist")!
//        let dict = NSDictionary(contentsOfFile: path)
//        tableData = dict!.object(forKey: ("CityCode", "DistrictCode", "Name")) as! [String]
        readPropertyList()
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 

        // Configure the cell...
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    func readPropertyList() {
        var propertyListForamt = PropertyListSerialization.PropertyListFormat.xml
        var plistData: [String: AnyObject] = [:]
        let plistPath: String? = Bundle.main.path(forResource: "Districts", ofType: "plist")!
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListForamt) as! [String: AnyObject]
        } catch {
            print("Error reading plist: \(error), format: \(propertyListForamt)")

    }

   
    

}
}
