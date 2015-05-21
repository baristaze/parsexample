//
//  LoginViewController.swift
//  parsexample
//
//  Created by Baris Taze on 5/20/15.
//  Copyright (c) 2015 Baris Taze. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUpButton(sender: AnyObject) {
        
        var username = self.emailTextField.text
        username = username.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        var password = self.passwordTextField.text
        password = password.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if !username.isEmpty && !password.isEmpty {
            var user = PFUser()
            user.username = username
            user.password = password
            user.email = username
            
            // user["phone"] = "415-392-0202"
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorString = error.userInfo?["error"] as? String
                    UIAlertView(title: "Signup Failed", message: errorString, delegate: nil, cancelButtonTitle: "Close").show()
                }
                else {
                    //println(PFUser.currentUser()?.email)
                    self.goToChatView()
                }
            }
        }
        else {
            UIAlertView(title: "Error", message: "Please enter email and password", delegate: nil, cancelButtonTitle: "Close").show()
        }
    }

    @IBAction func onSignInButton(sender: AnyObject) {
        
        var username = self.emailTextField.text
        username = username.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        var password = self.passwordTextField.text
        password = password.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if !username.isEmpty && !password.isEmpty {
            PFUser.logInWithUsernameInBackground(username, password:password) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    self.goToChatView()
                }
                else {
                    UIAlertView(title: "Login Failed", message: "Please check email and password", delegate: nil, cancelButtonTitle: "Close").show()
                }
            }
        }
        else {
            UIAlertView(title: "Error", message: "Please enter email and password", delegate: nil, cancelButtonTitle: "Close").show()
        }
    }
    
    func goToChatView(){
        performSegueWithIdentifier("chat.view.segue", sender: self)
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
