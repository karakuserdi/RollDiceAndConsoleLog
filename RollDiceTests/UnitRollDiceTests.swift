//
//  UnitRollDiceTests.swift
//  RollDiceTests
//
//  Created by riza erdi karakus on 14.03.2022.
//

import XCTest
@testable import RollDice

class UnitRollDiceTests: XCTestCase {

    var sut: RollDice!

    override func setUpWithError() throws {
        sut = RollDice(max: 6)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testRandomNumLessThenSeven(){
        let result = sut.nextInt()

        for _ in 1...1000{
            XCTAssertLessThan(result, 7)
        }
        
    }
    
    func testRandomNumBiggerThenZero(){
        let result = sut.nextInt()

        for _ in 1...1000{
            XCTAssertGreaterThan(result, 0)
        }
    }
    
    func testAllRandumNums(){
        let allNums: Set<Int> = [1,2,3,4,5,6]
        var newSet = Set<Int>()
        
        for _ in 1...100{
            let result = sut.nextInt()
            newSet.insert(result)
        }
        
        if newSet.count == allNums.count{
            if newSet.isSubset(of: allNums){
                XCTAssertTrue(true)
                return
            }
        }
        
        XCTAssertTrue(false)
    }
}
