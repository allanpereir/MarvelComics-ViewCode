//
//  CustomTableViewCell.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var screen:CustomCellScreen = CustomCellScreen()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.screen.backgroundColor = .black
        self.contentView.addSubview(self.screen)
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
