//
//  BeerTableViewControllerFactory.swift
//  iOS_lesson
//
//  Created by Леонид Горохов on 30.10.2023.
//

import Foundation

final class BeerTableViewControllerFactory {
    func build() -> BeerTableViewController {
        let service = BeerService()
        let viewController = BeerTableViewController(service: service)
        return viewController
    }
}
