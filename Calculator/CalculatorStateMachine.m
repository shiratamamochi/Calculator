//
//  CalculatorStateMachine.m
//  Calculator
//
//  Created by 末松　崇章 on 12/11/29.
//  Copyright (c) 2012年 Takaaki Suematsu. All rights reserved.
//

#import "CalculatorStateMachine.h"
#import "CalculatorViewController.h"

@implementation CalculatorStateMachine

@synthesize num;
@synthesize calc;

- (void)clearState:sender controller:(CalculatorViewController*)controller{
    [self setNum:Integer];
    [self setCalc:Null];
}

- (void)Dot:(id)sender controller:(CalculatorViewController*)controller {
    if ([self num] == Integer) {
        [self setNum:Decimal];
        //[controller setK:1];
    }
}

@end
