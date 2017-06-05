//
//  ViewController.swift
//  LogIn
//
//  Created by Мадияр on 22.04.17.
//  Copyright © 2017 Madiyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    
    
    @IBAction func selectProfilePhotoButton(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        profilePhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
         if (!isUserLoggedIn)
         {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
        
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
    
    
    

}

