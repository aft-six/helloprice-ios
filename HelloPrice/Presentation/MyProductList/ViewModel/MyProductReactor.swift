//
//  MyProductViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa
import ReactorKit

class MyProductReactor: Reactor {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    var initialState = State()
    
    enum Action {
        case fetchDatas
        case presentWebsite
    }
    
    enum Mutation {
        case setProducts([Product])
    }
    
    struct State {
        var products = [SectionOfDomainObject<Product>]()
    }
    
//    struct Output: ViewModelOutput {
//        let products = PublishRelay<[Product]>()
//        let productsCount = PublishRelay<Int>()
//    }
    
    
//    func mutate(action: Action) -> Observable<Mutation> {
//        switch action {
//        case .fetchCategories:
//            return repository.fetchCategories()
//                .map { categories -> Mutation in
//                    return Mutation.setCategories(categories)
//                }
//                .asObservable()
//        case .fetchCategoryItems(let id):
//            return repository.fetchCategoryItems(categoryId: id)
//                .map { products -> Mutation in
//                    return Mutation.setCategoryItems(products)
//                }
//                .asObservable()
//        }
//    }
//    
//    func reduce(state: State, mutation: Mutation) -> State {
//        var newState = state
//        switch mutation {
//        case .setCategories(let categories):
//            newState.categories = [SectionOfDomainObject<HomeCategory>(items: categories)]
//        case .setCategoryItems(let products):
//            newState.products = [SectionOfDomainObject<Product>(items: products)]
//        }
//        return newState
//    }
    
//    func transform(inputs: Input) -> Output {
//        
//        let output = Output()
//        
//        let products = inputs.fetchDatas
//            .flatMap {
//                self.useCase
//                    .fetchMyProducts()
//                    .do(onSuccess: { res in
//                        print("success!")
//                    })
//            }
//            .share()
//            
//        products
//            .map { self.responseToProducts($0) }
//            .bind(to: output.products)
//            .disposed(by: 👜)
//        products
//            .map { $0.contents?.count ?? 0 }
//            .bind(to: output.productsCount)
//            .disposed(by: 👜)
//        
//        inputs.fetchDatas.accept(())
//        
//        return output        
//    }
//    
//    
//    private func responseToProducts(_ response: FetchMyProductResponse) -> [Product] {
//        
//        var items = [Product]()
//        
//        response.contents?.forEach { contents in
//            let item = Product(id: contents.product?.id ?? 0,
//                               productName: contents.product?.productName ?? "",
//                               productCode: contents.product?.productCode ?? "",
//                               url: contents.product?.url ?? "",
//                               imageUrl: contents.product?.imageUrl ?? "",
//                               description: contents.product?.description ?? "",
//                               saleType: contents.product?.productSale?.saleType ?? "",
//                               price: contents.product?.productSale?.price ?? 0,
//                               prevPrice: contents.product?.productSale?.prevPrice ?? 0,
//                               additionalInfo: contents.product?.productSale?.additionalInfo ?? "x",
//                               priceChangeRate: contents.product?.productSale?.priceChangeRate ?? 0.0,
//                               lowestPrice: contents.lowestPrice ?? 0,
//                               lastUpdateAt: contents.product?.lastConfirmAt ?? "x",
//                               notifyOn: true)
//            items.append(item)
//        }
//        
//        return items
//    }
}
