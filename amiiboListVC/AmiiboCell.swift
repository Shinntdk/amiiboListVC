//
//  AmiiboCell.swift
//  amiiboListVC
//
//  Created by Natthida Kritveeranant on 1/5/2565 BE.
//

import UIKit

class AmiiboCell: UITableViewCell {

    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let gameSeriesLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .systemBackground

//        imageIV.backgroundColor = .black
//        nameLabel.backgroundColor = .blue

        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        gameSeriesLabel.font = UIFont(name: "Verdana", size: 14)

        imageIV.contentMode = .scaleAspectFit


        contentView.addSubview(imageIV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(gameSeriesLabel)

        // MARK: Layout
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate(
            [
                imageIV.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                imageIV.centerYAnchor.constraint(equalTo: centerYAnchor),
                imageIV.widthAnchor.constraint(equalToConstant: 40),
                imageIV.heightAnchor.constraint(equalToConstant: 40),

                nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor,constant: 5),
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),

                gameSeriesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                gameSeriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)

            ]
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
