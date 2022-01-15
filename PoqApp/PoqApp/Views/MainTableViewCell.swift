//
//  MainTableViewCell.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var visibilityLabelContainerView: UIView!
    @IBOutlet weak var visibilityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        visibilityLabelContainerView.addBorder(radius: 8)
    }

    func configure(with repo: ReposResponse) {
        titleLabel.text = repo.name
        descriptionLabel.text = repo.repoDescription
        visibilityLabel.text = repo.isPrivate ? "Private" : "Public"
    }

}
