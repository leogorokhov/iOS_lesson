//
//  ViewController.swift
//  iOS_lesson
//
//  Created by Леонид Горохов on 09.10.2023.
//

import UIKit
import Foundation

final class BeerTableViewController: UIViewController{
    
    private lazy var contentView: BeerTableView = {
        let view = BeerTableView()
        view.delegate = self
        return view
    }()
    
    private let service: BeerServicing
    
    init(service: BeerServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBeer { beers in
            DispatchQueue.main.async {
                self.contentView.configure(with: beers)
            }
        }
    }
}

extension BeerTableViewController: BeerTableViewDelegate {
    func didSelectRow(_ beerModel: BeerDTO) {
        let vc = BeerDetailsViewController()
        vc.beerModel = beerModel
        present(vc, animated: true)
    }
}


