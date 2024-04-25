//
//  Models.swift
//  appClone
//
//  Created by Lokesh Cheenu on 29/04/24.
//

import Foundation

enum Gender {
    case male, female, other
}

struct user {
    let username : String
    let name : (first:String, last:String)
    let birthDate : Date
    let gender : Gender
    let counts : Usercount
    let joindate : Date
}
struct Usercount {
    let followers : Int
    let following : Int
    let posts : Int
}

public enum UserPostType {
    case photo, video
}
/// represents a user post
public struct UserPost {
    let identifier : String
    let postType: UserPostType
    let ThumbnailImage : URL
    let postUrl : URL // either video or photo
    let caption : String?
    let likeCounts : [PostLikes]
    let comments : [PostComments]
    let Createddate : Date
    let TaggedUser : [String]
}
struct PostLikes {
    let username : String
    let postIdentifier : String
}
struct CommentLikes {
    let username : String
    let commentIdentifier : String
}
struct PostComments {
    let identifier : String
    let username : String
    let text : String
    let createdate : Date
    let likes : [CommentLikes]
    
}

