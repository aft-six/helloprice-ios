//
//  HomeRepositoryMock.swift
//  HelloPrice
//
//  Created by devming on 2021/01/29.
//  Copyright © 2021 besteyes. All rights reserved.
//

import RxSwift

final class HomeRepositoryMock: HomeRepository {
    
    var categories = [HomeCategory(title: "전체"),
                 HomeCategory(title: "가전제품"),
                 HomeCategory(title: "식품"),
                 HomeCategory(title: "화장품")]
    
    var products = [Product(id: 0, productName: "애플 에어팟 프로", productCode: "1010", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 30300, prevPrice: 34000, additionalInfo: "추가 정보", priceChangeRate: 12.3, lowestPrice: 29400, lastUpdateAt: "20-12-12", notifyOn: true), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false)
                 ]
    
    let apiService: HomeAPIService
    
    init(apiService: APIType) {
        self.apiService = apiService as! HomeAPIService
    }
    
    func fetchCategories() -> Single<[HomeCategory]> {
        return Observable<[HomeCategory]>.create { [weak self] emitter in
            guard let `self` = self else { return Disposables.create() }
            emitter.onNext(self.categories)
            emitter.onCompleted()
            return Disposables.create()
        }.asSingle()
    }
    
    func fetchCategoryItems(categoryId: Int) -> Single<[Product]> {
        return Observable<[Product]>.create { [weak self] emitter in
            guard let `self` = self else { return Disposables.create() }
            emitter.onNext(self.products)
            emitter.onCompleted()
            return Disposables.create()
        }.asSingle()
    }
    
}
