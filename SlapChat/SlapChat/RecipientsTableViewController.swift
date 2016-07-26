//
//  RecipientsTableViewController.swift
//  SlapChat
//
//  Created by Flatiron School on 7/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecipientsTableViewController: UITableViewController
{
    
    var managedRecipientObjects: [Recipient] = []
    let recipentStore: DataStore = DataStore()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        recipentStore.fetchData()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        recipentStore.fetchData()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return recipentStore.recipients.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath)

        let recipientCell = recipentStore.recipients[indexPath.row]
        
        cell.textLabel?.text = recipientCell.name

        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let indexPath = tableView.indexPathForSelectedRow
        let selectedRecipient = recipentStore.recipients[indexPath!.row]
        let messageViewController = segue.destinationViewController as! TableViewController
        
            if let messages = selectedRecipient.messages
            {
                messageViewController.messages = messages
            }
    }

}
