//
//  ViewController.swift
//  Ensemble Carpool
//
//  Created by Ansh Godha on 24/06/17.
//  Copyright © 2017 Ansh Godha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import KeychainSwift

class ViewController: UIViewController {
//input
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidLoad()
        let keyChain = DataService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "SignIn", sender: nil)
            
        }
    }
    
    func completeSignIn(id: String){
        let keyChain = DataService().keyChain
        keyChain.set(id, forKey: "uid")
    }
    
    @IBAction func SignIn(_ sender: Any){
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.completeSignIn(id: user!.uid)
                    self.performSegue(withIdentifier: "SignIn", sender: nil)

                } else {
                    print("Can't sign in, check your username and password")
                }
            }
        }
        
    }

}

