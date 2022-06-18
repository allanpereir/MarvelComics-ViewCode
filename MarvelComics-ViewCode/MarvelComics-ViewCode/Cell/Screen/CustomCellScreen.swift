//
//  CustomCellScreen.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import UIKit

class CustomCellScreen: UIView {
    
    lazy var imageCharacter: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    lazy var nameTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Comic's Name"
        label.numberOfLines = 2
        label.textColor = .white
        
       return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Comic's Desciption"
        label.numberOfLines = 10
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .red
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        self.addSubview(self.imageCharacter)
        self.addSubview(self.nameTextLabel)
        self.addSubview(self.descriptionTextLabel)
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            self.imageCharacter.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.imageCharacter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.imageCharacter.heightAnchor.constraint(equalToConstant: 100),
            self.imageCharacter.widthAnchor.constraint(equalToConstant: 100),
            self.nameTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.nameTextLabel.leadingAnchor.constraint(equalTo: self.imageCharacter.trailingAnchor, constant: 10),
            self.nameTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.descriptionTextLabel.topAnchor.constraint(equalTo: self.nameTextLabel.bottomAnchor, constant: 5),
            self.descriptionTextLabel.leadingAnchor.constraint(equalTo: self.imageCharacter.trailingAnchor, constant: 10),
            self.descriptionTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
}
