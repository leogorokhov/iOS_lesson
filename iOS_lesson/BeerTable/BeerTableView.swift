//
//  BeerTableView.swift
//  iOS_lesson
//
//  Created by Леонид Горохов on 30.10.2023.
//

import UIKit

final class BeerTableView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
 //       tableView.dataSource = self
        return tableView
    }()
    
        init() {
            super.init(frame: .zero)
            self.backgroundColor = .white
            addSubViews()
            makeConstraints()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

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
