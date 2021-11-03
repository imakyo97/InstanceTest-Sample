//
//  Plus.swift
//  instanceText-Sample-RxSwift
//
//  Created by 今村京平 on 2021/11/03.
//

import Foundation
import RxSwift
import RxCocoa

protocol PlusProtocol {
    func plusAction()
    var value: Observable<Int> { get }
}

final class Plus: PlusProtocol {

    private let valueRelay = BehaviorRelay<Int>(value: 0)

    func plusAction() {
        var value = valueRelay.value
        value += 1
        valueRelay.accept(value)
    }

    var value: Observable<Int> {
        valueRelay.asObservable()
    }

}
