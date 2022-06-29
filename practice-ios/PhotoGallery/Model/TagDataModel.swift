//
//  TagDataModel.swift
//  practice-ios
//
//  Created by 김민재 on 2022/06/30.
//

import Foundation

struct TagDataModel {
    let tagName: String
}


extension TagDataModel {
    static let sampleData: [TagDataModel] = [
        TagDataModel(tagName: "#포토서퍼"),
        TagDataModel(tagName: "#인스타그램"),
        TagDataModel(tagName: "#스티커"),
        TagDataModel(tagName: "#포토서퍼"),
        TagDataModel(tagName: "#인스타그램"),
        TagDataModel(tagName: "#스티커"),
        TagDataModel(tagName: "#포토서퍼"),
        TagDataModel(tagName: "#인스타그램"),
        TagDataModel(tagName: "#스티커")
    ]
}
