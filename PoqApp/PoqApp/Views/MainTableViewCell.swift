//
//  MainTableViewCell.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visibilityLabelContainerView: UIView!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stargazersButton: UIButton!
    @IBOutlet weak var watchersButton: UIButton!
    @IBOutlet weak var forksButton: UIButton!
    @IBOutlet weak var issuesButton: UIButton!

    @IBAction func openUrlButton(_ sender: UIButton) {
        if let urlStr = repo?.htmlURL,
           let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
    }

    var repo: ReposResponse?
    let dateFormatterGet = DateFormatter()
    let dateFormatterPrint = DateFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()
        visibilityLabelContainerView.addBorder(radius: 8)
        if #available(iOS 15.0, *) {
            stargazersButton.configuration?.imagePadding = 4
            watchersButton.configuration?.imagePadding = 4
            forksButton.configuration?.imagePadding = 4
            issuesButton.configuration?.imagePadding = 4
        } else {
            stargazersButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            watchersButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            forksButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            issuesButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        }
    }

    func configure(with repo: ReposResponse) {
        self.repo = repo
        titleLabel.text = repo.name
        visibilityLabel.text = repo.isPrivate ? "Private" : "Public"
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatterPrint.dateFormat = "MM/dd/yyyy HH:mm"
        if let date = dateFormatterGet.date(from: repo.updatedAt) {
            dateLabel.text = String(format: "Last Update: %@", dateFormatterPrint.string(from: date))
        }
        descriptionLabel.text = repo.repoDescription
        stargazersButton.setTitle(String(repo.stargazersCount), for: .normal)
        watchersButton.setTitle(String(repo.watchersCount), for: .normal)
        forksButton.setTitle(String(repo.forksCount), for: .normal)
        issuesButton.setTitle(String(repo.openIssuesCount), for: .normal)
    }

}
