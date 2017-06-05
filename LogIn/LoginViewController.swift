//
//  LoginViewController.swift
//  LogIn
//
//  Created by Мадияр on 26.04.17.
//  Copyright © 2017 Madiyar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButton(_ sender: Any) {
        let userEmail = userEmailTextField
        let userPassword = userPasswordTextField
        
        let userEmailStord = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStord = UserDefaults.standard.string(forKey: "userPassword")
        let userNameStored = UserDefaults.standard.string(forKey: "username")
        
        if (userEmail?.text == userEmailStord || userEmail?.text == userNameStored)
        {
            if (userPassword?.text == userPasswordStord)
            {
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            }
        }
        else {
            let alertMessage = UIAlertController(title: "Login Problem", message: "Email/Username or Password incorrect. Try again", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alertMessage.addAction(okAction)
            
            self.present(alertMessage, animated: true, completion: nil)
            return

        
        }
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
