//
//  CalculatorStateMachine.h
//  Calculator
//
//  Created by 末松　崇章 on 12/11/29.
//  Copyright (c) 2012年 Takaaki Suematsu. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CalculatorViewController.h"
@class CalculatorViewController;

@interface CalculatorStateMachine : NSObject

@property enum {Integer, Decimal} num;
@property enum {Null, Plus, Minus, Multi, Divide} calc;

-(void)clearState:sender controller:(CalculatorViewController*)controller;
-(void)Dot:(id)sender controller:(CalculatorViewController*)controller;

@end
