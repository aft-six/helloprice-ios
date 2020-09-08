//
//  MyProductViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa

class MyProductViewModel: BaseViewModel {
    struct Input: ViewModelInput {
        let fetchDatas: PublishRelay<Void>
        let presentWebsite: PublishRelay<Void>
    }
    
    struct Output: ViewModelOutput {
        let products = PublishRelay<[Product]>()
        let productsCount = PublishRelay<Int>()
    }
    
    var useCase: ShowMyProductListUseCase
    
    init(useCase: ShowMyProductListUseCase) {
        self.useCase = useCase
        
        super.init()
    }
    
    func transform(inputs: Input) -> Output {
        
        let output = Output()
        
        let products = inputs.fetchDatas
            .flatMap {
                self.useCase
                    .fetchMyProducts()
                    .do(onSuccess: { res in
                        print("success!")
                    })
            }
            .share()
            
        products
            .map { self.responseToProducts($0) }
            .bind(to: output.products)
            .disposed(by: 👜)
        products
            .map { $0.contents?.count ?? 0 }
            .bind(to: output.productsCount)
            .disposed(by: 👜)
        
        inputs.fetchDatas.accept(())
        
        return output        
    }
    
    
    private func responseToProducts(_ response: FetchMyProductResponse) -> [Product] {
        
        var items = [Product]()
        
        response.contents?.forEach { contents in
            let item = Product(id: contents.product?.id ?? 0,
                               productName: contents.product?.productName ?? "",
                               productCode: contents.product?.productCode ?? "",
                               url: contents.product?.url ?? "",
                               imageUrl: contents.product?.imageUrl ?? "",
                               description: contents.product?.description ?? "",
                               saleType: contents.product?.productSale?.saleType ?? "",
                               price: contents.product?.productSale?.price ?? 0,
                               prevPrice: contents.product?.productSale?.prevPrice ?? 0,
                               additionalInfo: contents.product?.productSale?.additionalInfo ?? "x",
                               priceChangeRate: contents.product?.productSale?.priceChangeRate ?? 0.0,
                               lowestPrice: contents.lowestPrice ?? 0,
                               lastUpdateAt: contents.product?.lastConfirmAt ?? "x",
                               notifyOn: true)
            items.append(item)
        }
        
        return items
    }
}
