//
//  HomeReactor.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa
import ReactorKit

class HomeReactor: Reactor {

    let repository: HomeRepository
    
    init(repository: HomeRepository) {
        self.repository = repository
    }
    
    let initialState = State()
    
    enum Action {
        case fetchCategories
        case fetchCategoryItems(Int)
    }
   
    enum Mutation {
        case setCategories([HomeCategory])
        case setCategoryItems([Product])
    }
    
    struct State {
        var categories = [SectionOfDomainObject<HomeCategory>]()
        var products = [SectionOfDomainObject<Product>]()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetchCategories:
            return repository.fetchCategories()
                .map { categories -> Mutation in
                    return Mutation.setCategories(categories)
                }
                .asObservable()
        case .fetchCategoryItems(let id):
            return repository.fetchCategoryItems(categoryId: id)
                .map { products -> Mutation in
                    return Mutation.setCategoryItems(products)
                }
                .asObservable()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setCategories(let categories):
            newState.categories = [SectionOfDomainObject<HomeCategory>(items: categories)]
        case .setCategoryItems(let products):
            newState.products = [SectionOfDomainObject<Product>(items: products)]
        }
        return newState
    }
    
    
}
//class HomeReactor: Reactor {
//    struct Input: ViewModelInput {
//        let fetchCategories: PublishRelay<Void>
//        let fetchCategoryItems: PublishRelay<Int>
//    }
//
//    struct Output: ViewModelOutput {
//        let categories = PublishRelay<[SectionOfDomainObject<HomeCategory>]>()
//        let products = PublishRelay<[SectionOfDomainObject<Product>]>()
//        let productsCount = PublishRelay<Int>()
//    }
//
//    var useCase: HomeUseCase
//
//    init(useCase: HomeUseCase) {
//        self.useCase = useCase
//    }
//
//    func transform(input: Input) -> Output {
//
//        let output = Output()
//
//        input.fetchCategories
//            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
//            .flatMap { self.useCase.fetchCategories() }
////            .withUnretained(self)
////            .flatMap { `self`, _ in self.useCase.fetchCategories() }
//            .map { [SectionOfDomainObject<HomeCategory>(items: $0)] }
//            .bind(to: output.categories)
//            .disposed(by: 👜)
//
//        input.fetchCategoryItems
//            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
//            .flatMap { self.useCase.fetchCategoryItems(categoryId: $0) }
////            .withUnretained(self)
////            .flatMap { `self`, item in self.useCase.fetchCategoryItems(categoryId: item)}
//            .map { [SectionOfDomainObject<Product>(items: $0)] }
//            .bind(to: output.products)
//            .disposed(by: 👜)
//
//        return output
//    }
//
////    func loadInit(completionHandler: () -> Void) {
////
////
////        inputs?.fetchCategories.accept(())
////        inputs?.fetchCategoryItems.accept(0)
////    }
//}
