//
//  SecondViewController.swift
//  instanceText-Sample-RxSwift
//
//  Created by 今村京平 on 2021/11/03.
//

import UIKit
import RxSwift
import RxCocoa

final class SecondViewController: UIViewController {

    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    
    private var secondViewModel: SecondViewModelType!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewModel = SecondViewModel(plus: ModelLocator.shared.plus)
        setupBinding()
    }

    private func setupBinding() {
        plusButton.rx.tap
            .subscribe(onNext: secondViewModel.inputs.didTapPlusButton)
            .disposed(by: disposeBag)

        secondViewModel.outputs.text
            .drive(valueLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
