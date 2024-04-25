//
//  AuthManager.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    //MARK : - Publicly Shared
    public func registerNewUser(UserName: String, Email: String, Password: String, completion: @escaping (Bool)-> Void)
    {
        /*
         - check if username is availabel
         - check if password is availabel
         */
        DataBaseManager.shared.canCreateNewUser(with: Email, username: UserName){ canCreate in
            if canCreate {
                /*
                 - create account
                 - add details to database
                 */
                Auth.auth().createUser(withEmail: Email, password: Password) {Result, error in
                    guard error == nil, Result != nil else{
                        //firebase auth could not create account
                        completion(false)
                        return
                    }
                    //insert into database
                    DataBaseManager.shared.insertNewUser(with: Email, username: UserName) {inserted in
                        if inserted {
                            // inserted successfully
                            completion(true)
                            return
                        }
                        else{
                            // failed to insert
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //either username or email does not exist
                completion(false)
            }
        }

    }
    
    public func LoginUser(UserName: String?, Email:String?, Password:String, completion: @escaping (Bool) ->Void)
    {
        if let email = Email{
            Auth.auth().signIn(withEmail: email, password: Password) { authresult, error in
                guard authresult != nil, error == nil else {
                    completion (false)
                    return
                }
                completion (true)
            }
        }
        else if let username = UserName {
            print(username)
        }
    }
    /// attempt to log out firebase user
    public func logout (completion: (Bool)-> Void) {
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch{
            print (error)
            completion(false)
            return
        }
    }
}
