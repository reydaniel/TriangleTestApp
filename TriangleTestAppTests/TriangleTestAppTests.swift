//
//  TriangleTestAppTests.swift
//  TriangleTestAppTests
//
//  Created by ReyDaniel on 09/12/21.
//

import XCTest
@testable import TriangleTestApp

class TriangleTestAppTests: XCTestCase {

    /// Function untuk memeriksa jika inputan kurang dari 1
    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-1, 2, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    
    /// Function untuk memeriksa jika inputan 1 + 2 <= inputan ke 3.
    func testInequalityTriangle() {
        XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
        
        XCTAssertThrowsError(try detectTriangle(5, 1, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
    }
    
    /// Function untuk memeriksa jika semua inputan bernilai sama, kembalikan kalimat segitiga sama sisi
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga sama sisi")
    }
    
    /// Function untuk memerika jika dua inputan bernilai sama, kembalikan kalimat segitiga sama kaki
    func testDetectIsoscelesTriangle() {
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga sama kaki")
    }
    
    ///
    func testDetectRandomTriangle() {
        XCTAssertEqual(try detectTriangle(3, 4, 5), "Segitiga sembarang")
    }
    
    func detectTriangle(
        _ sideA: Int,
        _ sideB: Int,
        _ sideC: Int
    ) throws -> String {
        let sides = [sideA, sideB, sideC].sorted()
        
        for side in sides {
            if side < 0 {
                throw TriangleError.invalidInput
            }
        }
        
        if sides[0] + sides[1] <= sides[2] {
            throw TriangleError.inequalityInput
        } else if sides[0] == sides[1] && sides[1] == sides[2] {
            return "Segitiga sama sisi"
        } else if sides[0] == sides[1] || sides[1] == sides[2] {
            return "Segitiga sama kaki"
        } else {
            return "Segitiga sembarang"
        }
    }
    
    enum TriangleError: Error {
        case invalidInput
        case inequalityInput
    }
}
