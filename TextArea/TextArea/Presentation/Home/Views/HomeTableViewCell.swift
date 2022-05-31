//
//  HomeTableViewCell.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/31.
//

import UIKit

class HomeTableViewCell: UICollectionViewCell {
    static let identifier = "HomeTableViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static private let _nibName: UINib = UINib(nibName: HomeTableViewCell.identifier, bundle: .main)
    
    static func register(to collectionView: UICollectionView) {
        collectionView.register(
            _nibName,
            forCellWithReuseIdentifier: HomeTableViewCell.identifier
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
            self.imageView.image = UIImage(systemName: "text.book.closed")
        case .folder:
            self.imageView.image = UIImage(systemName: "folder.fill")
        }
        
        self.nameLabel.text = cellModel.name
    }
}
