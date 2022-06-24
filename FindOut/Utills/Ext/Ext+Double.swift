//
//  Ext+Double.swift
//  FindOut
//
//  Created by Putra on 12/06/22.
//

import Foundation

extension Double {
    func removeZerosFromEnd() -> String {
            let formatter = NumberFormatter()
            let number = NSNumber(value: self)
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
            return String(formatter.string(from: number) ?? "")
        }
}
