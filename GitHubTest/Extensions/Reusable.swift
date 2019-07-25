//
//  Reusable.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibReusable: Reusable {
    static var nib: UINib { get }
}

extension NibReusable {
    static var nib:  UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: Self.self))
    }
}

extension UITableView {
    final func register<T: UITableViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func  register<T: UITableViewHeaderFooterView & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
}

extension UITableView {
    final func dequeueReusableCell<T: UITableViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'.")
        }
        return cell
    }
    
    final func dequeueReusableCell<T: UITableViewHeaderFooterView & Reusable>() -> T {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'.")
        }
        return cell
    }
}
