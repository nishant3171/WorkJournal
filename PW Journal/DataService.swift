//
//  DataService.swift
//  PW Journal
//
//  Created by nishant punia on 11/02/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import Foundation
import Firebase

class DataService{
    
    static var ds = DataService()
    
    private var _baseURL = Firebase(url: "https://pwjournal.firebaseio.com")
    private var _usersURl = Firebase(url: "https://pwjournal.firebaseio.com/users")
    private var _dataURL = Firebase(url: "https://pwjournal.firebaseio.com/data")
    
    var baseURL: Firebase {
        return _baseURL
    }
    
    var userURL: Firebase {
        return _usersURl
    }
    
    var dataURL: Firebase {
        return _dataURL
    }
    
    func firebaseUsers(uid: String, user: Dictionary<String, String>) {
        _usersURl.childByAppendingPath(uid).setValue(user)
    }
}
