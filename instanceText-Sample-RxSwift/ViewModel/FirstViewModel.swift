//
//  FirstViewModel.swift
//  instanceText-Sample-RxSwift
//
//  Created by 今村京平 on 2021/11/03.
//

import Foundation
import RxSwift
import RxCocoa

protocol FirstViewModelInput {
    func didTapPlusButton()
}

protocol FirstViewModelOutput {
    var text: Driver<String> { get }
}

protocol FirstViewModelType {
    var inputs: FirstViewModelInput { get }
    var outputs: FirstViewModelOutput { get }
}

final class FirstViewModel: FirstViewModelInput, FirstViewModelOutput {

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

extension FirstViewModel: FirstViewModelType {
    var inputs: FirstViewModelInput { return self }
    var outputs: FirstViewModelOutput { return self }
}
