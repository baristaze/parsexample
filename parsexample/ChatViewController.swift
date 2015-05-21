//
//  ChatViewController.swift
//  parsexample
//
//  Created by Francisco de la Pena on 5/20/15.
//  Copyright (c) 2015 Baris Taze. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSendMessage(sender: AnyObject) {
        var message = PFObject(className:"Message")
        message["text"] = textField.text
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                println(self.textField.text)
            } else {
                println("Failed")// There was a problem, check error.description
            }
        }
        
    }
    
    func onTimer() {
        var query = PFQuery(className:"Message")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackgroundWithBlock { (messages: [AnyObject]?, error: NSError?) -> Void in
            if error == nil && messages != nil {
                println(messages)
            } else {
                println(error)
            }
        }
    }

    /*

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
