//
//  MainViewController.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class MainViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    var reposViewModel = ReposViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repos"
        // Do any additional setup after loading the view.
        setupBindings()
        reposViewModel.requestData()
    }

    func setupBindings() {
        // Error Handling
        reposViewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                self.alert.setMessage(error)
                self.alert.show()
            })
            .disposed(by: disposeBag)

        // Repos TableView
        reposViewModel
            .repos
            .observe(on: MainScheduler.instance)
            .bind(to: tableView
                    .rx
                    .items(cellIdentifier: "MainTableViewCell", cellType: MainTableViewCell.self)) { _, element, cell in
                cell.configure(with: element)
            }
            .disposed(by: disposeBag)

    }

}
