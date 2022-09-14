//
//  Place.swift
//  TripCoreMotion20
//
//  Created by cmStudent on 2022/08/23.
//

import SwiftUI

struct Place: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var placeName: String
    var imageName: String
    var bgName: String
}

var sample_places: [Place] = [
    .init(placeName: "GreatWall", imageName: "GreatWall", bgName: "GreatWallBG"),
    .init(placeName: "NanJing", imageName: "NanJing", bgName: "NanJingBG"),
    .init(placeName: "drawing", imageName: "drawing", bgName: "drawingBG"),
    .init(placeName: "mountain", imageName: "mountain", bgName: "mountainBG"),
    .init(placeName: "tower", imageName: "tower", bgName: "towerBG")

]


//struct Place: Identifiable, Hashable {
//    var id: String = UUID().uuidString
//    var placeName: String
//    var imageName: String
//    var bgName: String
//}
//
//var sample_places: [Place] = [
//    .init(placeName: "drawing", imageName: "drawing", bgName: "drawingBG"),
//    .init(placeName: "mountain", imageName: "mountain", bgName: "mountainBG"),
//    .init(placeName: "tower", imageName: "tower", bgName: "towerBG")
//
//]
