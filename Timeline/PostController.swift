//
//  PostController.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import Foundation

class PostController {

    static func fetchTimelineForUser(user: User, completion: (post: [Post]) -> Void) {
        completion(post: mockPosts())
    }

    static func addPost(image: String, caption: String? = nil, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().last)
    }

    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        completion(post: mockPosts().first)
    }

    static func postForUser(user: User, completion: (posts: [Post]?) -> Void) {
        completion(posts: mockPosts())
    }

    static func deletePost(post: Post) {

    }

    static func addCommentWithTextToPost(comment: String, post: Post, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().first)
    }

    static func deleteComment(comment: String, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[1])
    }

    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().first)
    }

    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[1])
    }

    static func orderPosts(posts: [Post]) -> [Post] {
        return []
    }

    static func mockPosts() -> [Post] {
        return [
            Post(imageEndPoint: "-K1l4125TYvKMc7rcp5e", caption: "FUN", username: "jab", comments: [], likes: [], identifier: "abc"),
            Post(imageEndPoint: "-K1l4125TYvKMc7rcp5e", caption: "snow", username: "baj", comments: [], likes: [], identifier: "xyz"),
            Post(imageEndPoint: "-K1l4125TYvKMc7rcp5e", caption: "rain", username: "abc", comments: [], likes: [], identifier: "jkl")
                ]
    }
}
