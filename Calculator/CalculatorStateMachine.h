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
{
    double buff;
    int k;
}

@property enum {Integer, Decimal} num;
@property enum {Null, Plus, Minus, Multi, Divide} calc;
@property double x,buff;
@property int k;

-(void)clearState;
-(void)setDecimal;
-(double)calcButton:(int)n;
-(double)clearValue;
-(double)calcX:(double)cx;
-(void)calcBuff:(double)cx;

@end
