//
//  AgentTests.m
//  TDD
//
//  Created by Ricardo Maqueda on 02/07/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//


#import <XCTest/XCTest.h>
//#import <OCMock/OCMock.h>
#import "Agent.h"


@interface AgentTests : XCTestCase {
    // Core Data stack objects.
    NSManagedObjectModel *model;
    NSPersistentStoreCoordinator *coordinator;
    NSPersistentStore *store;
    NSManagedObjectContext *context;
    // Object to test.
    Agent *sut;
}

@end


@implementation AgentTests

#pragma mark - Set up and tear down

- (void) setUp {
    [super setUp];
    [self createCoreDataStack];
    [self createFixture];
    [self createSut];
}


- (void) createCoreDataStack {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    model = [NSManagedObjectModel mergedModelFromBundles:@[bundle]];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    store = [coordinator addPersistentStoreWithType: NSInMemoryStoreType
                                      configuration: nil
                                                URL: nil
                                            options: nil
                                              error: NULL];
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = coordinator;
}


- (void) createFixture {
    // Test data
}


- (void) createSut {
    sut = [NSEntityDescription insertNewObjectForEntityForName:@"Agent" inManagedObjectContext:context];
}


- (void) tearDown {
    [self releaseSut];
    [self releaseFixture];
    [self releaseCoreDataStack];
    [super tearDown];
}


- (void) releaseSut {
    sut = nil;
}


- (void) releaseFixture {

}


- (void) releaseCoreDataStack {
    context = nil;
    store = nil;
    coordinator = nil;
    model = nil;
}


#pragma mark - Basic test

- (void) testObjectIsNotNil {
    // Prepare
    //sut.name = @"Pepe";
    // Operate

    // Check
    XCTAssertNotNil(sut, @"The object to test must be created in setUp.");
}

- (void) testAssessmentCalculation {
    sut.motivation = @10;
    sut.destructionPower = @5;
    XCTAssertEqual([sut.assessment unsignedIntegerValue], (NSUInteger)7.5, @"Assessment must be calculated.");
}

@end
