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
        currentUser = UserController.mockUsers().first
    }

    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {

    }

    static func fetchAllUsers(completion: ([User]) -> Void) {

    }

    static func userFollowsUser(userLhs: User, userRhs: User, completion: (success: Bool) -> Void) {

    }

    static func followedByUser(user: User, completion: (users: [User]?) -> Void) {

    }

    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {

    }

    static func createUser(email: String, username: String, password: String, profileImage: String, bio: String? = nil, url: String? = nil, completion: (success: Bool, user: User?) -> Void) {

    }

    static func updateUser(user: User, bio: String? = nil, url: String? = nil, completion: (success: Bool, user: User?) -> Void) {

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
