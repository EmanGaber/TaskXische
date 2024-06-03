//
//  UITableView+Extensions.swift
//  Done
//
//  Created by Eman Gaber on 15/09/2023.
//  Copyright © 2023 Eman Gaber. All rights reserved.
//

import UIKit

extension UITableView {
    
    public   func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    public  func dequeue<Cell: UITableViewCell>(cellClass: Cell.Type) -> Cell {
        let identifier = String(describing: cellClass.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    public  func registerHeaderFooterNib<Cell: UITableViewHeaderFooterView>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: Cell.self))
    }
    
    public  func dequeueHeaderFooter<Cell: UITableViewHeaderFooterView>(cellClass: Cell.Type) -> Cell {
        let identifier = String(describing: cellClass.self)
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    public func initialize<Cell: UITableViewCell>(cellClass: Cell.Type? = nil, delegate: UITableViewDelegate, dataSource: UITableViewDataSource, estimatedRowHeight: CGFloat? = nil, setupRefreshControl: () -> UIRefreshControl? = {nil}, headerView: UIView? = nil, footerView: UIView? = UIView(), edgeInsets: UIEdgeInsets? = nil) {
        if cellClass != nil {
            self.registerCellNib(cellClass: cellClass!)
        }
        self.dataSource = dataSource
        self.delegate = delegate
        self.refreshControl = setupRefreshControl()
        self.tableHeaderView = headerView
        self.tableFooterView = footerView
        if estimatedRowHeight != nil {
            self.estimatedRowHeight = estimatedRowHeight!
        }
        self.rowHeight = UITableView.automaticDimension
    }
}
