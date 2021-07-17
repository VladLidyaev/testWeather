//
//  HomeViewModel.swift
//  testWeather
//
//  Created by Vlad on 17.07.2021.
//

import Foundation
import RxCocoa
import RxSwift

class homeViewModel {
    
    var searchText = BehaviorRelay(value: "")
    var data : BehaviorRelay<[cityShortInfo]>
    let DBag = DisposeBag()
    
    init() {
        self.data = BehaviorRelay<[cityShortInfo]>(value: [])
    }
    
}
