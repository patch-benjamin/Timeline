//
//  Comment.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import Foundation

// TODO: Implement the equatable protocol by comparing the username and identifier
struct Comment {
    let username: String
    let text: String
    let postIdentifier: String
    let identifier: String?

    init(username: String, text: String, postIdentifier: String, identifier: String? = nil) {
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
}
