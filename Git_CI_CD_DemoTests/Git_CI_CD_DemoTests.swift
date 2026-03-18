//
//  Git_CI_CD_DemoTests.swift
//  Git_CI_CD_DemoTests
//
//  Created by Ankur Nema on 18/03/26.
//

import XCTest
@testable import Git_CI_CD_Demo

final class Git_CI_CD_DemoTests: XCTestCase {
    private var sut : TodoViewModel!
    override func setUp() {
        sut = TodoViewModel()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func test_addTask(){
        //Arrange
        let newTask = "test case added"
        let initialTaskCount = sut.tasks.count
        
        //Act
        sut.addTask(taskName: newTask)
        
        //Assert
        XCTAssertEqual(sut.tasks.count, initialTaskCount + 1)
        XCTAssertEqual(sut.tasks.last?.name,newTask)
    }
}
