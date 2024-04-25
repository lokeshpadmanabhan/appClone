//
//  DataBaseManager.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import FirebaseDatabase

public class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    private let database = Database.database().reference()
    //mark - public
    /// - check if userName and email is availabel
    /// - parameters
    /// - email: string representing email
    ///  - username: string representing username
    public func canCreateNewUser(with email:String, username:String, completion: (Bool)-> Void){
        completion(true)
    }
    
    /// - inserts new userindatabase
    ///  - parameters
    /// - email: string representing email
    ///  - username: string representing username
    ///   - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email:String, username:String, completion: @escaping (Bool)-> Void) {
        database.child(email.safedatabasekey()).setValue(["username": username]) { error , _ in
            if error == nil {
                //succeded
                completion(true)
                return
            }
            else {
                //failed
                completion(false)
                return
            }
        }
    }
    
    
    
}

