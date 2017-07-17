//
//  SignOutCode.swift
//  Ensemble Carpool
//
//  Created by Ansh Godha on 10/07/17.
//  Copyright © 2017 Ansh Godha. All rights reserved.
//

import UIKit
import Firebase
import KeychainSwift


class SignOutCode: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SignOut(_ sender: Any){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        DataService().keyChain.delete("uid")
        dismiss(animated: true, completion: nil)
    }
}
