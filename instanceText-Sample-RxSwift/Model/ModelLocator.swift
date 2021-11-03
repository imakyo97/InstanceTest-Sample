//
//  ModelLocator.swift
//  instanceText-Sample-RxSwift
//
//  Created by 今村京平 on 2021/11/03.
//

import Foundation

struct ModelLocator {
    private init() {}
    static let shared = ModelLocator()
    let plus = Plus()
}
