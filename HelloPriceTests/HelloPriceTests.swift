//
//  HelloPriceTests.swift
//  HelloPriceTests
//
//  Created by devming on 2020/05/30.
//  Copyright © 2020 besteyes. All rights reserved.
//

import XCTest
//import RxTest
import RxSwift
import RxCocoa
@testable import HelloPrice

class HelloPriceTests: XCTestCase {
//    var disposeBag = DisposeBag()
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    func testFetchingMyProduct() throws {
//        
//        // given
//        let scheduler = TestScheduler(initialClock: 0)
//        let useCase = MockShowMyProductListUseCase()
//        let myProductViewModel = MyProductViewModel(useCase: useCase)
//        let fetchDatas = PublishRelay<Void>()
//        let presentWebsite = PublishRelay<Void>()
//        let inputs = MyProductViewModel
//                        .Input(fetchDatas: fetchDatas,
//                               presentWebsite: presentWebsite)
//        
//        // when
//        let outputs = myProductViewModel.transform(inputs: inputs)
//        let observable = scheduler.createHotObservable([
//            .next(990, outputs.productsCount.asObservable()),
////            .next(500, outputs.products),
//            .completed(1000)
//        ])
//        let data = observable.flatMap { $0 }
//        let res = scheduler.start { data }
//        XCTAssertRecordedElements(res.events, [3])
//        
////        let correctMessages = Recorded.events(
////            .next(210, 3),
////            .completed(1000)
////        )
////
////        // then
////        XCTAssertEqual(res.events, correctMessages)
//        
////        observable
//        
////        outputs.products
////            .asObservable()
////            .subscribe(onNext: { products in
////                print("--성공--")
////                products.forEach { product in
////                    print("product: \(product)")
////                }
////                print("----")
////            }, onError: { _ in
////                XCTAssert(false, "실패")
////            }, onCompleted: {
////                XCTAssert(true, "성공")
////            })
////            .disposed(by: disposeBag)
//        
////        let res = scheduler.start { observable.map { $0 } }
////        let correctMessages = Recorded.events(
////            .next(210, 3),
////            .completed(1000)
////        )
////
////        // then
////        XCTAssertEqual(res.events, correctMessages)
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
