//
//  SecondViewModel.swift
//  instanceText-Sample-RxSwift
//
//  Created by 今村京平 on 2021/11/03.
//

import Foundation
import RxSwift
import RxCocoa

protocol SecondViewModelInput {
    func didTapPlusButton()
}

protocol SecondViewModelOutput {
    var text: Driver<String> { get }
}

protocol SecondViewModelType {
    var inputs: SecondViewModelInput { get }
    var outputs: SecondViewModelOutput { get }
}

final class SecondViewModel: SecondViewModelInput, SecondViewModelOutput {

    private let plus: PlusProtocol
    private let textRelay = BehaviorRelay<String>(value: "0")
    private let disposeBag = DisposeBag()

    init(plus: PlusProtocol) {
        self.plus = plus
        setupBinding()
    }

    private func setupBinding() {
        plus.value
            .map { String($0) }
            .bind(to: textRelay)
            .disposed(by: disposeBag)
    }

    func didTapPlusButton() {
        plus.plusAction()
    }

    var text: Driver<String> {
        textRelay.asDriver()
    }
}

extension SecondViewModel: SecondViewModelType {
    var inputs: SecondViewModelInput { return self }
    var outputs: SecondViewModelOutput { return self }
}
