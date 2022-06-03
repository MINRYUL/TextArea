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
    
    private let _widthInset: CGFloat = 40
    private let _homeReactor = HomeViewReactor()
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    // MARK: Properties
    let dataSource = RxCollectionViewSectionedReloadDataSource<HomeListSection>(
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
        },
        configureSupplementaryView: { dataSource, collectionView, kind, indexPath ->
            UICollectionReusableView in
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerData = dataSource[indexPath.section]
                
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier, for: indexPath) as? HomeHeaderView,
                    let titleKey = headerData.titleKey else {
                  return UICollectionReusableView()
                }
                
                headerView.display(titleKey: titleKey)
                
                return headerView
            default:
                assert(false, "Unexpected element kind")
            }
        }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._configureView()
        self._configureCollectionView()
        
        self.bind(reactor: self._homeReactor)
    }
    
    private func _configureView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home".localized()
    }
    
    private func _configureCollectionView() {
        HomeTableViewCell.register(to: self.homeCollectionView)
        HomeCollectionViewCell.register(to: self.homeCollectionView)
        HomeHeaderView.register(to: self.homeCollectionView)
        
        self.homeCollectionView.collectionViewLayout = self._makeTableFlowLayout()
        self.homeCollectionView.contentInset = UIEdgeInsets(
            top: 10,
            left: _widthInset/2 - 10,
            bottom: 70,
            right: _widthInset/2 - 10
        )
    }
    
    private func _makeTableFlowLayout() -> UICollectionViewFlowLayout {
        let screenBounds = UIScreen.main.bounds
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: screenBounds.width - self._widthInset,
            height: 40
        )
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        flowLayout.headerReferenceSize = CGSize(width: screenBounds.width, height: 60)
        return flowLayout
    }
    
    private func _makeCollectionFlowLayout() -> UICollectionViewFlowLayout {
        let screenBounds = UIScreen.main.bounds
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: (screenBounds.width - self._widthInset)/3 - 10,
            height: (screenBounds.width - self._widthInset)/3 + 10
        )
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.minimumLineSpacing = 8
        flowLayout.headerReferenceSize = CGSize(width: screenBounds.width, height: 80)
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
