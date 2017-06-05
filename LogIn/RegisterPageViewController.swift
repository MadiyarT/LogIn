//
//  RegisterPageViewController.swift
//  LogIn
//
//  Created by Мадияр on 24.04.17.
//  Copyright © 2017 Madiyar. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userConfirmPassword = confirmPassword.text
        let userFirstName = nameTextField.text
        let userLastName = surnameTextField.text
        let username = usernameTextField.text
        
        if ((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)! || (userFirstName?.isEmpty)! || (userLastName?.isEmpty)! || (username?.isEmpty)!)
        {
            displayAlertMessage(userMessage: "All fields are required")
            return
        }
        
        else if (userPassword != userConfirmPassword)
        {
            displayAlertMessage(userMessage: "Passwords are not match")
            return
        }
        
        else {
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.set(userFirstName, forKey: "userFirstName")
        UserDefaults.standard.set(userLastName, forKey: "userLastName")
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.synchronize()
          
            let alertMessage = UIAlertController(title: "Congratulations", message: "Registration is succesful.Thank you", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion: nil)
            }
        alertMessage.addAction(okAction)
        self.present(alertMessage, animated: true, completion: nil)
            
        
        }
    
    }
    
    func displayAlertMessage(userMessage: String)
    {
        let alertMessage = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertMessage.addAction(okAction)
        
        self.present(alertMessage, animated: true, completion: nil)
    
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
