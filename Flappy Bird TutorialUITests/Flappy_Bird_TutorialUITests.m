//
//  Flappy_Bird_TutorialUITests.m
//  Flappy Bird TutorialUITests
//
//  Created by Milos Mokic on 12/13/15.
//  Copyright © 2015 Milos Mokic. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Flappy_Bird_TutorialUITests : XCTestCase

@end

@implementation Flappy_Bird_TutorialUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
