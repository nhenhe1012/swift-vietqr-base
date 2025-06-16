//
//  SwiftVietQRTests.swift
//  SwiftVietQRTests
//
//  Created by Tien Nguyen on 15/6/25.
//

import XCTest
import SwiftEmvFormatParser

@testable import SwiftVietQRBase

final class SwiftVietQRTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testQRCodeToData1() throws {
        let string = "00020101021238560010A0000007270126000697041501121133666688880208QRIBFTTA530370454067900005802VN62240820dong gop quy vac xin630486D1"
        let data = EmvFormatParser().qrCodeToData(string)
        let destination = data?.getDestination()
        XCTAssert(destination?.isValid() ?? false)
    }
    
    func testQRCodeToData2() throws {
        let string = "00020101021138560010A0000007270126000697043201121133666688880208QRIBFTTA53037045802VN6304152A"
        let data = EmvFormatParser().qrCodeToData(string)
        let destination = data?.getDestination()
        XCTAssert(destination?.isValid() ?? false)
    }
    
    func testQRCodeWrongData1() throws {
        let string = "00020101021138570010A0000007270126000697043201121133666688880208QRIBFTTA53037045802VN6304152A"
        let data = EmvFormatParser().qrCodeToData(string)
        let destination = data?.getDestination()
        XCTAssert(destination == nil)
    }
    
    func testQRCodeWrongData2() throws {
        let string = "0002010102113850010A0000007270126000697043201121133666688880208QRIBFTTA53037045802VN6304152A"
        let data = EmvFormatParser().qrCodeToData(string)
        let destination = data?.getDestination()
        XCTAssert(destination == nil)
    }
    
    func testQRCodeWrongData3() throws {
        let string = "00020101021138560010A0000007270126000696043201121133666688880208QRIBFTTA53037045802VN6304152A"
        let data = EmvFormatParser().qrCodeToData(string)
        let destination = data?.getDestination()
        XCTAssert(destination?.isValid() == false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
