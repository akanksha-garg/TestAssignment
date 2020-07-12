//
//  Blog.swift
//  TestAssignment
//
//  Created by Akanksha garg on 12/07/20.
//  Copyright © 2020 Akanksha garg. All rights reserved.
//

import Foundation

// MARK: - Country
struct Blog: Codable {
    let blogId: String
    let title: String?
    let creationDate: String
    let description: String?
    var commentsCount: Int = 0
    var likesCount: Int = 0
    let media: [Media]?
    let user: [User]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blogId = try container.decode(String.self, forKey: .blogId)
        self.title = try container.decode(String.self, forKey: .title)
        self.creationDate = try container.decode(String.self, forKey: .creationDate)
        self.description = try container.decode(String.self, forKey: .description)
        self.commentsCount = try container.decode(Int.self, forKey: .commentsCount)
        self.likesCount = try container.decode(Int.self, forKey: .likesCount)
        let media = try container.decode([Media].self, forKey: .media)
        self.media = media.filter({$0.mediaId != nil})
        let user = try container.decode([User].self, forKey: .user)
        self.user = user.filter({$0.userID != nil})
    }
    
    private enum CodingKeys: String, CodingKey {
        case blogId = "id"
        case creationDate = "createdAt"
        case description = "content"
        case commentsCount = "comments"
        case likesCount = "likes"
        case media = "media"
        case user = "user"
        case title
    }
    
}

// MARK: - Media
struct Media: Codable {
    let mediaId: String!
    let imageHref: String?
    
    enum CodingKeys: String, CodingKey {
        case mediaId = "id"
        case imageHref = "image"
    }
    
}

// MARK: - User
struct User: Codable {
    let userID: String!
    let firstName: String
    let lastName: String?
    let avatarHref: String?
    let designation: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "name"
        case lastName = "lastname"
        case userID = "id"
        case avatarHref = "avatar"
        case designation
    }
    
}
