//
//  HelloPriceTests.swift
//  HelloPriceTests
//
//  Created by devming on 2020/05/30.
//  Copyright © 2020 besteyes. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import HelloPrice

class HelloPriceTests: XCTestCase {
    var disposeBag = DisposeBag()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testFetchingMyProduct() throws {
        
        // given
        let useCase = ShowMyProductListUseCaseMock()
        let myProductViewModel = MyProductViewModel(useCase: useCase)
        let fetchDatas = PublishRelay<Void>()
        let presentWebsite = PublishRelay<Void>()
        let inputs = MyProductViewModel
                        .Input(fetchDatas: fetchDatas,
                               presentWebsite: presentWebsite)
        
        // when
        let outputs = myProductViewModel.transform(inputs: inputs)
        outputs.products
            .asObservable()
            .subscribe(onNext: { products in
                print("--성공--")
                products.forEach { product in
                    print("product: \(product)")
                }
                print("----")
            }, onError: { _ in
                XCTAssert(false, "실패")
            }, onCompleted: {
                XCTAssert(true, "성공")
            })
            .disposed(by: disposeBag)
        
        // then
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
