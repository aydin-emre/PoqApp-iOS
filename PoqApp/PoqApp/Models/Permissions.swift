//
//  Permissions.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import Foundation

struct Permissions: Codable {

    let admin, maintain, push, triage: Bool
    let pull: Bool

}

enum Visibility: String, Codable {
    case visibilityPublic = "public"
}
