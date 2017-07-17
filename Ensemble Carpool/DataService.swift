//
//  DataService.swift
//  Ensemble Carpool
//
//  Created by Ansh Godha on 08/07/17.
//  Copyright © 2017 Ansh Godha. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import KeychainSwift

let DB_BASE = Database.database().reference()

class DataService {
    private var _keyChain = KeychainSwift()
    private var _refDatabase = DB_BASE
    
    var keyChain: KeychainSwift {
        get {
            return _keyChain
        } set {
            _keyChain = newValue
        }
    
    }

}
