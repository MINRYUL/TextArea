//
//  HomeCollectionViewCell.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/31.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static private let _nibName: UINib = UINib(nibName: HomeCollectionViewCell.identifier, bundle: .main)
    
    static func register(to collectionView: UICollectionView) {
        collectionView.register(
            _nibName,
            forCellWithReuseIdentifier: HomeCollectionViewCell.identifier
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
    
    func display(cellModel: HomeModel) {
        switch cellModel.fileType {
        case .file:
            self.imageView.image = UIImage(systemName: "doc")
        case .folder:
            self.imageView.image = UIImage(systemName: "folder")
        }
        
        self.nameLabel.text = cellModel.name
    }
}
