//
//  Post.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import Foundation

// TODO: Implement the equatable protocol by comparing the username and identifier
struct Post: Equatable {
    let imageEndPoint: String
    let caption: String?
    let username: String
    var comments: [Comment]
    var likes: [Like]
    let identifier: String?

    init(imageEndPoint: String, caption: String? = nil, username: String, comments: [Comment], likes: [Like], identifier: String? = nil) {
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
        self.identifier = identifier
    }
}
func ==(lhs: Post, rhs: Post) -> Bool {
    return (lhs.username == rhs.username && lhs.identifier == rhs.identifier)
}