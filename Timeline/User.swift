//
//  User.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import Foundation




// TODO: implement the equatable protocol by comparing the username and identifier
struct User: Equatable {
    let username: String
    let bio: String?
    let url: String?
    let identifier: String?

    init(username: String, bio: String? = nil, url: String? = nil, identifier: String? = nil) {
        self.username = username
        self.bio = bio
        self.url = url
        self.identifier = identifier
    }

}

func ==(lhs: User, rhs: User) -> Bool {
    return (lhs.username == rhs.username && lhs.identifier == rhs.identifier)
}