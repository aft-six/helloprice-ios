//
//  SearchViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/12/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewModel: BaseViewModel {
    struct Input: ViewModelInput {
        let readRecentSearches: PublishRelay<Void>
    }
    
    struct Output: ViewModelOutput {
        let recentSearches: Driver<[SectionOfDomainObject<SearchRecentObject>]>
    }
    
    var useCase: SearchProductUseCase
    
    init(useCase: SearchProductUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        
        let recentSearches = input.readRecentSearches
            .withUnretained(self)
            .flatMap { `self`, _ in self.useCase.readRecentSearches() }
            .map { [SectionOfDomainObject<SearchRecentObject>(items: $0)] }
            .asDriver(onErrorJustReturn: [SectionOfDomainObject<SearchRecentObject>]())
        
        return Output(recentSearches: recentSearches)
    }
}
