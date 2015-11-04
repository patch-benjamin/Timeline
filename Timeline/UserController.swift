//
//  UserController.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import Foundation
import UIKit


class UserController {

    static let sharedInstance = UserController()

    var currentUser: User!

    init() {
//        currentUser = UserController.mockUsers().first
        currentUser = nil
    }

    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        completion(user: mockUsers().first)
    }

    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        completion(users: mockUsers())
    }

    static func userFollowsUser(userLhs: User, userRhs: User, completion: (follows: Bool) -> Void) {
        completion(follows: true)
    }

    static func followedByUser(user: User, completion: (users: [User]?) -> Void) {
        completion(users: mockUsers())
    }

    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers().first)
    }

    static func createUser(email: String, username: String, password: String, bio: String? = nil, url: String? = nil, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers().last)
    }

    static func updateUser(user: User, bio: String? = nil, url: String? = nil, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers().first)
    }

    static func logOutCurrentUser() {
        
    }

    static func mockUsers() -> [User] {
        return [
            User(username: "jab", bio: "user1", url: "wwww.google.com", identifier: "xyz123"),
            User(username: "baj", bio: "user2", url: "wwww.yahoo.com", identifier: "abc123"),
            User(username: "abc", bio: "user3", url: "wwww.bing.com", identifier: "xyz456")

        ]
    }

}
