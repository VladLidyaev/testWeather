//
//  configs.swift
//  testWeather
//
//  Created by Vlad on 17.07.2021.
//

import Foundation
import UIKit

class configs {
    
//  Main
    public let spacing : CGFloat = 12
    public let radius : CGFloat = 5
    public let backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    public let detailsColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
//  Home
    public let homeTitle = "Weather"
    public let homePlaceHolder = " Search by City name"
    public let searchBlockHeight : CGFloat = 60
    public let searchHeight : CGFloat = 50
    public let searchBorder : CGFloat = 3
    public let searchSpacing : CGFloat = 2
    public let buttonClearImage = UIImage(systemName: "arrow.left")
    public let buttonReloadImage = UIImage(systemName: "arrow.clockwise")
    
    
    public static var shared: configs = {
        let instance = configs()
        return instance
    }()
    
    private init() {}
}

extension configs: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
