//
//  StorageManager.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import Foundation

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IgStorageManagerError: Error {
        case failedToDownload
    }
    
    //MARK_PUBLIC
    
    public func uploadUserPost(model: UserPost,
                               completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IgStorageManagerError>)-> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        })
    }
    

}
