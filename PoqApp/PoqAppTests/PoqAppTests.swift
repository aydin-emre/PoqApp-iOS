//
//  PoqAppTests.swift
//  PoqAppTests
//
//  Created by Emre on 15.01.2022.
//

import XCTest
import RxSwift
import RxCocoa
@testable import PoqApp

class PoqAppTests: XCTestCase {

    let reposViewModel = ReposViewModel()
    let disposeBag = DisposeBag()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetRepos() throws {
        let expectation = expectation(description: "Service Call")

        reposViewModel.requestData()
        reposViewModel
            .repos
            .subscribe(onNext: { repos in
                defer {
                    expectation.fulfill()
                }
                if !repos.isEmpty {
                    XCTAssert(true)
                } else {
                    XCTFail("No source found!", file: #filePath, line: #line)
                }
          }).disposed(by: disposeBag)

        wait(for: [expectation], timeout: 2)
    }

}
