//
//  SwiftVietQR.swift
//  SwiftVietQR
//
//  Created by Tien Nguyen on 15/6/25.
//

import Foundation
#if canImport(SwiftEmvFormatParser)
import SwiftEmvFormatParser
#endif

public extension EmvObject {
    func getDestination() -> Destination? {
        let structures = Destination.getMapping()
        for structure in structures {
            guard let template = structure["bankId"], let bankId = self.getValueBy(template: template) else { continue }
            guard let template = structure["accountNumber"], let accountNumber = self.getValueBy(template: template) else { continue }
            var amount = ""
            var message = ""
            if let template = structure["amount"] {
                amount = self.getValueBy(template: template) ?? ""
            }
            if let template = structure["message"] {
                message = self.getValueBy(template: template) ?? ""
            }
            return Destination(bankId: bankId, accountNumber: accountNumber, amount: amount, message: message, isValidCheckSum: isValidCheckSum())
        }
        return nil
    }
    
    func getValueBy(template: String) -> String? {
        let components = template.split(separator: ".")
        var data: EmvObject? = self
        for i in 0..<components.count {
            data = data?.getData().first(where: { $0.getId() == components[i] })
        }
        return data?.getValue()
    }
}
