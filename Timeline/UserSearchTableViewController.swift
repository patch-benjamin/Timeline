//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import UIKit


class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {

    // MARK: Enums
    enum ViewMode: Int {
        case Friends = 0
        case All = 1
        
        func users(completion: (users: [User]?) -> Void) {
            if self == .Friends {
                UserController.followedByUser(UserController.sharedInstance.currentUser, completion: completion)
            } else {
                UserController.fetchAllUsers(completion)
            }
        }
    }

    // MARK: Properties
    var usersDataSource: [User] = []

    var searchController: UISearchController!

    var mode: ViewMode {
        return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
    }

    
    // MARK: Outlets
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    // MARK: Actions
    @IBAction func selectedIndexChanged(sender: UISegmentedControl) {
        updateViewBasedOnMode()
    }
    
    
    func updateViewBasedOnMode() {
        mode.users { (users) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if let users = users {
                    self.usersDataSource = users
                } else {
                    // do something/error handle?
                    print("There are no users for the current user mode")
                }
                self.tableView.reloadData()
            })
        }
    }
    //MARK: Building a Search Bar
    func setUpSearchController() {

        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("userSearchResults")

        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false

        tableView.tableHeaderView = searchController.searchBar

    }
    //MARK: Controlling the Search
    func updateSearchResultsForSearchController(searchController: UISearchController) {

        let searchTerm = searchController.searchBar.text!
        let resultsViewController = searchController.searchResultsController as! UserListSearchResultsTableViewController

        resultsViewController.userDataSource = self.usersDataSource.filter({$0.username.lowercaseString.containsString(searchTerm)})
        resultsViewController.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        updateViewBasedOnMode()
        setUpSearchController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersDataSource.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = usersDataSource[indexPath.row].username
        
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let sender = sender as! UITableViewCell

        var selectedUser: User

        if let indexPath = (searchController.searchResultsController as? UserListSearchResultsTableViewController)?.tableView.indexPathForCell(sender) {
            let usersDataSource = (searchController.searchResultsController as! UserListSearchResultsTableViewController).userDataSource
            selectedUser = self.usersDataSource[indexPath.row]

        } else {

            let indexPath = tableView.indexPathForCell(sender)!
            selectedUser = self.usersDataSource[indexPath.row]

        }
        let destinationViewController = segue.destinationViewController as! ProfileViewController
        destinationViewController.user = selectedUser
    }


}
