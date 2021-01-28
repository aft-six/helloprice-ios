//
//  HomeRepository.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

final class HomeRepositoryImpl: HomeRepository {
    
    let apiService: HomeAPIService
    
    init(apiService: APIType) {
        self.apiService = apiService as! HomeAPIService
    }
    
    func fetchCategories() -> Single<[HomeCategory]> {
        return apiService.fetchHomeCategories()
            .map { $0.contents }
            .map { contents in
                var categories = [HomeCategory]()
                contents.forEach {
                    let category = HomeCategory(title: $0.value)
                    categories.append(category)
                }
                return categories
            }
    }
    
    func fetchCategoryItems(categoryId: Int) -> Single<[Product]> {
        return apiService.fetchHomeCategoryItems(categoryId: categoryId)
            .map { $0.contents }
            .map { [weak self] in
                guard let `self` = self else { return [Product]() }
                return self.makeProductObject(contents: $0)
            }
    }
    
    func makeProductObject(contents: [NotifiedProductContents]?) -> [Product] {
        var products = [Product]()
        contents?
            .forEach {
                guard let item = $0.product, let lowestPrice = $0.lowestPrice,
                      let id = item.id else { return }
                
                let productObject = Product(id: id,
                                            productName: item.productName,
                                            productCode: item.productCode,
                                            url: item.url,
                                            imageUrl: item.imageUrl,
                                            description: item.description,
                                            saleStatus: item.saleStatus,
                                            saleType: item.productSale?.saleType,
                                            price: item.productSale?.price,
                                            prevPrice: item.productSale?.prevPrice,
                                            additionalInfo: item.productSale?.additionalInfo,
                                            priceChangeRate: item.productSale?.priceChangeRate,
                                            lowestPrice: lowestPrice,
                                            lastUpdateAt: item.lastConfirmAt,
                                            notifyOn: false)
                products.append(productObject)
            }
        
        return products
    }
}
