//
//  ViewController.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/26.
//

import UIKit

import RxSwift
import RxCocoa
import ReactorKit

final class HomeViewController: BaseViewController, StoryboardView {
    typealias Reactor = HomeViewReactor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._configureView()
    }
    
    private func _configureView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home".localized()
    }
}

//MARK: - Binding
extension HomeViewController {
    func bind(reactor: Reactor) {
        //MARK: - Action
        
        
        
        //MARK: - State
        
        
        
        //MARK: - View
    }
}
