//
//  BeerTableManager.swift
//  iOS_lesson
//
//  Created by Леонид Горохов on 30.10.2023.
//

import Foundation
import UIKit
// MARK: - BeerTableManagerDelegate

protocol BeerTableManagerDelegate {
    func didSelectRow(_ beerModel: BeerDTO)
}

final class BeerTableManager: NSObject {
    var delegate: BeerTableManagerDelegate?
    var tableData: [BeerDTO] = []
}


// MARK: - UITableViewDataSource

extension BeerTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = tableData[indexPath.row]
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        // configuration.image = UIImage()
        configuration.text = beer.name
        configuration.secondaryText = beer.tagline
        cell.contentConfiguration = configuration
        return cell
    }
}

extension BeerTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let beerModel = tableData[indexPath.row]
        delegate?.didSelectRow(beerModel)
    }
}
