//
//  FirstViewController.swift
//  instanceText-Sample-RxSwift
//
//  Created by 今村京平 on 2021/11/03.
//

import UIKit
import RxSwift
import RxCocoa

final class FirstViewController: UIViewController {

    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!

    private var firstViewModel: FirstViewModelType!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewModel = FirstViewModel(plus: ModelLocator.shared.plus)
        setupBinding()
    }

    private func setupBinding() {
        plusButton.rx.tap
            .subscribe(onNext: firstViewModel.inputs.didTapPlusButton)
            .disposed(by: disposeBag)

        firstViewModel.outputs.text
            .drive(valueLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
