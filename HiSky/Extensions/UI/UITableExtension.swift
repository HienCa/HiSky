//
//  UITableExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 5/4/24.
//

import UIKit
extension UITableView {

    public var boundsWithoutInset: CGRect {
        var boundsWithoutInset = bounds
        boundsWithoutInset.origin.y += contentInset.top
        boundsWithoutInset.size.height -= contentInset.top + contentInset.bottom
        return boundsWithoutInset
    }

    public func isRowCompletelyVisible(at indexPath: IndexPath) -> Bool {
        let rect = rectForRow(at: indexPath)
        return boundsWithoutInset.contains(rect)
    }
    
    func getAllCells() -> [UITableViewCell] {
        var cells = [UITableViewCell]()
        for i in 0..<self.numberOfSections
        {
            for j in 0..<self.numberOfRows(inSection: i)
            {
                if let cell = self.cellForRow(at: IndexPath(row: j, section: i)) {
                    cells.append(cell)
                }
                
            }
        }
        return cells
    }
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
           return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
       }
    
    func scrollToBottomChat(isAnimated:Bool = true){

           DispatchQueue.main.async {
               let indexPath = IndexPath(
                   row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                   section: self.numberOfSections - 1)
               if self.hasRowAtIndexPath(indexPath: indexPath) {
                   self.scrollToRow(at: indexPath, at: .bottom, animated: isAnimated)
               }
           }
    }
    
    
}

