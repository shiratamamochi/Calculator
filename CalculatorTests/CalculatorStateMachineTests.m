//
//  CalculatorStateMachineTests.m
//  Calculator
//
//  Created by 末松　崇章 on 13/01/10.
//  Copyright (c) 2013年 Takaaki Suematsu. All rights reserved.
//

#import "CalculatorStateMachineTests.h"

#import "CalculatorStateMachine.h"

CalculatorStateMachine* statemachine;

@implementation CalculatorStateMachineTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    statemachine = [[CalculatorStateMachine alloc] init];
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testCalcButton
{
    /*num,x,nを適当に決める。(num=Integer,x=3,n=8)
     calcButtonを実行。
     x([statemachine calcButton:n])の返り値が正しい値になってるか？
     */
    [statemachine setNum:Integer];
    [statemachine setX:3];
    [statemachine setK:0];
    STAssertEqualsWithAccuracy(38.0, [statemachine calcButton:8], 0.00001, @"calcButton error");
    /* num=Decimal,x=5,n=9,k=2 */
    [statemachine setNum:Decimal];
    [statemachine setX:5];
    [statemachine setK:2];
    STAssertEqualsWithAccuracy(5.09, [statemachine calcButton:9], 0.00001, @"calcButton error");
}

- (void)testCalcX
{
    [statemachine setCalc:Null];
    [statemachine setX:0];
    [statemachine setBuff:24];
    STAssertEqualsWithAccuracy(2.0, [statemachine calcX:2], 0.00001, @"calcX error");
    
    // 24 + 2 = 26
    [statemachine setCalc:Plus];
    [statemachine setX:0];
    [statemachine setBuff:24];
    STAssertEqualsWithAccuracy(26.0, [statemachine calcX:2], 0.00001, @"calcX error");
    STAssertEquals(Plus, [statemachine calc], @"calc changed");
    
    // 19 - 6 = 13
    [statemachine setCalc:Minus];
    [statemachine setX:0];
    [statemachine setBuff:19];
    STAssertEqualsWithAccuracy(13.0, [statemachine calcX:6], 0.00001, @"calcX error");
    STAssertEquals(Minus, [statemachine calc], @"calc changed");
    
    // 3 * 7 = 21
    [statemachine setCalc:Multi];
    [statemachine setX:0];
    [statemachine setBuff:3];
    STAssertEqualsWithAccuracy(21.0, [statemachine calcX:7], 0.00001, @"calcX error");
    STAssertEquals(Multi, [statemachine calc], @"calc changed");
    
    // 256 / 2 = 128
    [statemachine setCalc:Divide];
    [statemachine setX:0];
    [statemachine setBuff:256];
    STAssertEqualsWithAccuracy(128.0, [statemachine calcX:2], 0.00001, @"calcX error");
    STAssertEquals(Divide, [statemachine calc], @"calc changed");
}

- (void)testCalcBuff
{
    // 24 + 2 = 26
    [statemachine setCalc:Plus];
    [statemachine setBuff:24];
    [statemachine calcBuff:2];
    STAssertEqualsWithAccuracy(26.0, [statemachine buff], 0.00001, @"calcBuff error");
    STAssertEquals(Plus, [statemachine calc], @"calc changed");
    
    // 19 - 6 = 13
    [statemachine setCalc:Minus];
    [statemachine setX:0];
    [statemachine setBuff:19];
    STAssertEqualsWithAccuracy(13.0, [statemachine calcX:6], 0.00001, @"calcX error");
    STAssertEquals(Minus, [statemachine calc], @"calc changed");
    
    // 3 * 7 = 21
    [statemachine setCalc:Multi];
    [statemachine setX:0];
    [statemachine setBuff:3];
    STAssertEqualsWithAccuracy(21.0, [statemachine calcX:7], 0.00001, @"calcX error");
    STAssertEquals(Multi, [statemachine calc], @"calc changed");
    
    // 256 / 2 = 128
    [statemachine setCalc:Divide];
    [statemachine setX:0];
    [statemachine setBuff:256];
    STAssertEqualsWithAccuracy(128.0, [statemachine calcX:2], 0.00001, @"calcX error");
    STAssertEquals(Divide, [statemachine calc], @"calc changed");
}

@end
