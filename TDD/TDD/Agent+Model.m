//
//  Agent+Model.m
//  TDD
//
//  Created by Jose A. Herran on 02/07/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import "Agent+Model.h"

@implementation Agent (Model)

- (NSNumber *)assessment {
    [self willAccessValueForKey:@"assessment"];
    NSUInteger detPower = [[self primitiveValueForKey:@"destructionPower"] unsignedIntegerValue];
    NSUInteger motivation = [[self primitiveValueForKey:@"motivation"] unsignedIntegerValue];
    NSUInteger assessmentValue = (detPower + motivation) / 2;
    [self didChangeValueForKey:@"assessment"];
    return @(assessmentValue);
}

@end
