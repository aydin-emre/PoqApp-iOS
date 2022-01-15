//
//  ReposViewModel.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

class ReposViewModel {

    public let repos: PublishSubject<[ReposResponse]> = PublishSubject()
    public let error: PublishSubject<String> = PublishSubject()

    public func requestData() {
        NetworkManager.shared.repos { result in
            switch result {
            case .success(let response):
                self.repos.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
