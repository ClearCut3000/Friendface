//
//  User.swift
//  Friendface
//
//  Created by Николай Никитин on 27.10.2022.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]

    static let example = User(id: UUID(),
                              isActive: true,
                              name: "Nik Nikitin",
                              age: 35,
                              company: "Nikitin Inc.",
                              email: "nikitin.nikolay.v@gmail.com",
                              address: "666, Elm Street, Moscow, Russia",
                              about: "Useless iOS developer",
                              registered: Date.now,
                              tags: ["swift", "swiftui", "uikit"],
                              friends: [])
}

struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
}
