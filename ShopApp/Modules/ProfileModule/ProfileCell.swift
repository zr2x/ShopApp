//
//  ProfileCollectionViewCell.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 19.09.2023.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    static let cellReuseIdentifire = "ProfileCell"
    
    private var profileImageView = UIImageView()
    private var profileNameLabel = UILabel()
    private var profileIdLabel = UILabel()
    private var ordersCountLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        setupCell()
        setupConstraints()
    }
    
    private func setupCell() {
        contentView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(profileNameLabel)
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(profileIdLabel)
        profileIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(ordersCountLabel)
        ordersCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func setupProfileImageView() {
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 10
    }
}

