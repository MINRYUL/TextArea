//
//  HomeHeaderView.swift
//  TextArea
//
//  Created by 김민창 on 2022/06/03.
//

import UIKit

final class HomeHeaderView: UICollectionReusableView {
    static let identifier = "HomeHeaderView"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static private let _nibName: UINib = UINib(nibName: HomeHeaderView.identifier, bundle: .main)
    
    static func register(to collectionView: UICollectionView) {
        collectionView.register(
            _nibName,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeHeaderView.identifier
        )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self._configureView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self._configureView()
    }
    
    override func prepareForReuse() { }
    
    private func _configureView() { }
    
    func display(titleKey: String) {
        self.titleLabel.text = titleKey.localized()
    }
}

