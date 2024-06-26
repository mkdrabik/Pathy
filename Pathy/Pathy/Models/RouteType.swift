//
//  RouteType.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import Foundation

enum RouteType: String, Codable, CaseIterable{
    case run
    case walk
    case hike
    case bike
    case other
    
        // This value is used when translated to & from JSON with Codable
        // So, you don't need to worry about converting it yourself
        // You can just have a property of type RouteType in another Codable type
    var rawValue: String {
        switch self {
        case .run: "run"
        case .walk: "walk"
        case .hike: "hike"
        case .bike: "bike"
        case .other: "other"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .run: "figure.run"
        case .walk: "figure.walk"
        case .hike: "figure.hiking"
        case .bike: "bicycle"
        case .other: "point.topleft.down.curvedto.point.bottomright.up"
        }
    }
}
