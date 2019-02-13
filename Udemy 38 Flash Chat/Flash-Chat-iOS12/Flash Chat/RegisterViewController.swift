//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        if let email = emailTextfield.text {
            if let password = passwordTextfield.text {
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        // success
                        self.performSegue(withIdentifier: "goToChat", sender: self)
                    }
                }
            }
        }
        
        
        

        
        
    } 
    
    
}
