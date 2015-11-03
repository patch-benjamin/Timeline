//
//  PostController.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import Foundation

class PostController {

    static func fetchTimelineForUser(user: User, completion: ([Post]) -> Void) {

    }

    static func addPost(image: String, caption: String? = nil, completion: (success: Bool, post: Post?) -> Void) {

    }

    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {

    }

    static func postForUser(user: User, completion: (posts: [Post]?) -> Void) {

    }

    static func deletePost(post: Post) {

    }

    static func addCommentWithTextToPost(comment: String, post: Post, completion: (success: Bool, post: Post?) -> Void) {

    }

    static func deleteComment(comment: String, completion: (success: Bool, post: Post?) -> Void) {

    }

    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {

    }

    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {

    }

    static func orderPosts(posts: [Post]) -> [Post] {
        return []
    }

    static func mockPosts() -> [Post] {
        return [
//            Post(imageEndPoint: <#T##String#>, caption: <#T##String?#>, username: <#T##String#>, comments: <#T##[Comment]#>, likes: <#T##[Like]#>, identifier: <#T##String?#>),
//            Post(imageEndPoint: <#T##String#>, caption: <#T##String?#>, username: <#T##String#>, comments: <#T##[Comment]#>, likes: <#T##[Like]#>, identifier: <#T##String?#>),
//            Post(imageEndPoint: <#T##String#>, caption: <#T##String?#>, username: <#T##String#>, comments: <#T##[Comment]#>, likes: <#T##[Like]#>, identifier: <#T##String?#>)
                ]
    }
}
