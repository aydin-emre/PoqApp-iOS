//
//  License.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import Foundation

struct License: Codable {

    let key: Key
    let name: Name
    let spdxID: SpdxID
    let url: String?
    let nodeID: LicenseNodeID

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }

}

enum Key: String, Codable {
    case apache20 = "apache-2.0"
    case mit = "mit"
    case other = "other"
}

enum Name: String, Codable {
    case apacheLicense20 = "Apache License 2.0"
    case mitLicense = "MIT License"
    case other = "Other"
}

enum LicenseNodeID: String, Codable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTEz = "MDc6TGljZW5zZTEz"
    case mDc6TGljZW5ZZTI = "MDc6TGljZW5zZTI="
}

enum SpdxID: String, Codable {
    case apache20 = "Apache-2.0"
    case mit = "MIT"
    case noassertion = "NOASSERTION"
}
