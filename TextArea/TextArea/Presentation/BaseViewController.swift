//
//  BaseViewController.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/26.
//

import UIKit

import RxSwift

class BaseViewController: UIViewController {
    class var className: String {
        return String(describing: self)
    }
    
    var disposeBag = DisposeBag()
}
