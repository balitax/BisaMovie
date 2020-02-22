//
//  UITableView+Extensions.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

public extension UITableView {
    static let defaultCellIdentifier = "Cell"
    
    /// Register NIB to table view.
    ///
    /// - Parameters:
    ///   - nibType: Type of the NIB.
    ///   - identifier: Name of the reusable cell identifier.
    ///   - bundle: Bundle if not local.
    func register<T: UITableViewCell>(
        nib nibType: T.Type,
        withIdentifier identifier: String = UITableView.defaultCellIdentifier,
        inBundle bundle: Bundle? = nil
    ) {
        register(
            UINib(nibName: String(describing: nibType), bundle: bundle),
            forCellReuseIdentifier: identifier
        )
    }
}

public extension UITableView {
    static let defaultHeaderFooterIdentifier = "Section"
    
    /// Register NIB to table view.
    ///
    /// - Parameters:
    ///   - nibType: Type of the NIB.
    ///   - identifier: Name of the reusable cell identifier.
    ///   - bundle: Bundle if not local.
    func register<T: UITableViewHeaderFooterView>(
        nib nibType: T.Type,
        withIdentifier identifier: String = UITableView.defaultHeaderFooterIdentifier,
        inBundle bundle: Bundle? = nil
    ) {
        register(
            UINib(nibName: String(describing: nibType), bundle: bundle),
            forHeaderFooterViewReuseIdentifier: identifier
        )
    }
    
    /// Gets the reusable header with default identifier name.
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {
        dequeueReusableHeaderFooterView(withIdentifier: UITableView.defaultHeaderFooterIdentifier) as? T
    }
}

public extension UITableView {
    
    /// Gets the reusable cell with default identifier name.
    ///
    /// - Parameter indexPath: The index path of the cell from the table.
    subscript(indexPath: IndexPath) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath)
    }

    /// Gets the reusable cell with default identifier name.
    ///
    /// - Parameter indexPath: The index path of the cell from the table.
    subscript<T: UITableViewCell>(indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath) as? T ?? T()
    }

    /// Gets the reusable cell with the specified identifier name.
    ///
    /// - Parameters:
    ///   - indexPath: The index path of the cell from the table.
    ///   - identifier: Name of the reusable cell identifier.
    subscript(indexPath: IndexPath, withIdentifier identifier: String) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    /// Gets the reusable cell with default identifier name.
    ///
    /// - Parameters:
    ///   - indexPath: The index path of the cell from the table.
    ///   - identifier: Name of the reusable cell identifier.
    subscript<T: UITableViewCell>(indexPath: IndexPath, withIdentifier identifier: String) -> T {
        dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T ?? T()
    }
    
    func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion:{ _ in
            completion()
        })
    }

    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                     let indexPath = IndexPath(row: 0, section: 0)
                     self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }

    enum scrollsTo {
        case top,bottom
    }
    
}
