//
//  ViewController.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/26.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit

final class HomeViewController: BaseViewController, StoryboardView {
    typealias Reactor = HomeViewReactor
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    // MARK: Properties
    let dataSource = RxCollectionViewSectionedAnimatedDataSource<HomeListSection>(
        configureCell: { dataSource, collectionView, indexPath, item in
            
            switch item {
            case .Table(data: let data):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeTableViewCell.identifier,
                    for: indexPath
                ) as? HomeTableViewCell else { return UICollectionViewCell() }
                
                cell.display(cellModel: data)
                
                return cell
            
            case .Collection(data: let data):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCollectionViewCell.identifier,
                    for: indexPath
                ) as? HomeCollectionViewCell else { return UICollectionViewCell() }
                
                cell.display(cellModel: data)
                
                return cell
            }
        }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._configureView()
        self._configureCollectionView()
    }
    
    private func _configureView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home".localized()
    }
    
    private func _configureCollectionView() {
        HomeTableViewCell.register(to: self.homeCollectionView)
        HomeCollectionViewCell.register(to: self.homeCollectionView)
        
        self.homeCollectionView.collectionViewLayout = self._makeTableFlowLayout()
    }
    
    private func _makeTableFlowLayout() -> UICollectionViewFlowLayout {
        let screenBounds = UIScreen.main.bounds
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: screenBounds.width, height: 50)
        return flowLayout
    }
    
    private func _makeCollectionFlowLayout() -> UICollectionViewFlowLayout {
        let screenBounds = UIScreen.main.bounds
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: screenBounds.width / 3, height: (screenBounds.width / 3) + 30)
        return flowLayout
    }
}

//MARK: - Binding
extension HomeViewController {
    func bind(reactor: Reactor) {
        //MARK: - Action
        
        
        //MARK: - State
        reactor.state.asObservable().map { $0.sections }
            .bind(to: self.homeCollectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: self.disposeBag)
        
        //MARK: - View
    }
}
