//
//  CreateSurveyTableViewController.swift
//  PollMobile
//
//  Created by Alejandro Valencia on 1/06/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit

class CreateSurveyViewController: UserViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, PollAccessoryDelegate {

    @IBOutlet weak var textViewPlaceholder: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    var accessoryView:PollAccessoryView?
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = (self.tabBarController as! MainTabBarViewController).user
        self.accessoryView = loadNib()
        self.accessoryView!.frame = CGRectMake(0.0, 0.0, self.view.frame.width, 30.0)
        self.textView.inputAccessoryView = self.accessoryView
        self.accessoryView?.delegate = self
        self.view.bringSubviewToFront(self.textViewPlaceholder)
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
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

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Selected \(section)")
        if section == 0  {
            return self.questions.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected \(indexPath.section) and \(indexPath.row)")
        self.textView.resignFirstResponder()
        self.updatePlaceholderLabel()
    }
    
    func updatePlaceholderLabel(){
        if self.textView.text.isEmpty {
            self.textViewPlaceholder.hidden = false
            
            println("Placeholder \(self.textViewPlaceholder)")
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("statement") as! QuestionTableViewCell
        cell.questionLabel.text = self.questions[indexPath.row].questionText
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    // Override to support conditional rearranging of the table view.
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        println("CELL: \(self.tableView.cellForRowAtIndexPath(indexPath))")
//        return (self.tableView.cellForRowAtIndexPath(indexPath) as! QuestionTableViewCell).questionLabel.frame.height + 20.0
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func textViewDidBeginEditing(textView: UITextView) {
        println("Start Editing...")
        self.textViewPlaceholder.hidden = true
//        textView.inputAccessoryView = self.accessoryView!
//        println("acc view... \(textView.inputAccessoryView!)")
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        self.updatePlaceholderLabel()
    }
    
    private func loadNib() -> PollAccessoryView {
        return NSBundle.mainBundle().loadNibNamed("PollAccessoryView", owner: nil, options: nil)[0] as! PollAccessoryView
    }
    
    func donePressed() {
        println("Done pressed...")
        self.textView.resignFirstResponder()
        self.updatePlaceholderLabel()
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue) {
        let qvc = segue.sourceViewController as! CreateQuestionViewController
        println("Question text: \(qvc.questionTextView.text)")
        qvc.questionTextView.resignFirstResponder()
        if !qvc.questionTextView.text.isEmpty {
            var question = Question()
            question.questionText = qvc.questionTextView.text
            self.questions.append(question)
//            self.tableView.reloadData()
        }
    }

    @IBAction func createPoll() {
        let poll = Poll()
        poll.description = self.textView.text
        var jsonQuestions = "["
        for (index, value) in enumerate(questions){
            jsonQuestions += value.questionText!
            if index != (questions.count-1) {
                jsonQuestions += ","
            }
        }
        jsonQuestions += "]"
        poll.data = jsonQuestions
        poll.owner = self.user!
        var pollClient = PollClient()
        pollClient.createPoll(poll)
    }
}
