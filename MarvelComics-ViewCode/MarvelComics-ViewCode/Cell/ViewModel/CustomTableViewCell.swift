//
//  CustomTableViewCell.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import Foundation
import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    var screen:CustomCellScreen = CustomCellScreen()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.screen.backgroundColor = .black
        self.selectionStyle = .none
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
    
    public func setup(value: Character) {
        self.screen.nameTextLabel.text = value.name
        self.screen.descriptionTextLabel.text = value.description
        let url = extractImage(data: value.thumbnail)
        self.screen.imageCharacter.sd_setImage(with: url)
    }
    
    public func extractImage(data: [String : String]) -> URL? {
        let path = data["path"] ?? ""
        let ext = data ["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
}
