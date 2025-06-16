//
//  Untitled.swift
//  SwiftVietQRBase
//
//  Created by Tien Nguyen on 16/6/25.
//

import SwiftEmvFormatParser

public struct Destination {
    var bankId: String
    var accountNumber: String
    var amount: String = ""
    var message: String = ""
    var isValidCheckSum = false
    
    public static func getMapping() -> [[String: String]] {
        return [["bankId": "38.01.00",
                 "accountNumber": "38.01.01",
                 "amount": "54",
                 "message": "62"]]
    }
    
    public func isValid() -> Bool {
        return !bankId.isEmpty && !accountNumber.isEmpty && isValidCheckSum
    }
}
