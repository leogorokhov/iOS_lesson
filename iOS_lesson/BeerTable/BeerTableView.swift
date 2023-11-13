//
//  BeerTableView.swift
//  iOS_lesson
//
//  Created by Леонид Горохов on 30.10.2023.
//

import UIKit

protocol BeerTableViewDelegate {
    func didSelectRow(_ beerModel: BeerDTO)
}

final class BeerTableView: UIView {
    private lazy var tableManager = BeerTableManager()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        return tableView
    }()
    
    var delegate: BeerTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubViews()
        makeConstraints()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [BeerDTO]) {
        tableManager.tableData = viewModel
        tableView.reloadData()
    }
    
}

// MARK: - BeerTableManagerDelegate

extension BeerTableView: BeerTableManagerDelegate {
    func didSelectRow(_ beerModel: BeerDTO) {
        delegate?.didSelectRow(beerModel)
    }
}

// MARK: - Private

private extension BeerTableView {
    func addSubViews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    func makeConstraints() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
