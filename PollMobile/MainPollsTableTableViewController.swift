//
//  MainPollsTableTableViewController.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 14/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainPollsTableTableViewController: UITableViewController, RestClientProtocol, UISearchBarDelegate {
  
  var user:Account?
  var pollList = [Poll]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    println("In table view...\(user)")
    var pollClient:PollClient = PollClient()
    pollClient.delegate = self
    pollClient.getAllPolls();
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pollList.count
  }
  
  func processResponse(json:JSON){
    println("In delegate processResponse \(json)")
    for (index: String, subJson: JSON) in json {
      println("INDEX STRING \(subJson)")
      var poll = Poll(json: subJson)
      pollList.append(poll)
    }
    self.tableView.reloadData()
  }
  
  func processError(errorCode: Int?, errorDescription: String?) {
    println("In delegate processError \(errorDescription)")
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MainPollCell", forIndexPath: indexPath) as! MainTableViewCell
    cell.createdByLabel.text = "Created By " + self.pollList[indexPath.row].owner.username
    cell.title.text = self.pollList[indexPath.row].title
    cell.pollDescription.text = self.pollList[indexPath.row].description
    return cell;
  }
  
  func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
    return UIBarPosition.TopAttached
  }
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the specified item to be editable.
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
  // Return NO if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
}
