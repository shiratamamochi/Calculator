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
@synthesize x,buff,k;

- (void)clearState{
    [self setNum:Integer];
    [self setCalc:Null];
}

- (void)setDecimal{
    if ([self num] == Integer) {
        k=1;
        [self setNum:Decimal];
    }
}

- (double)calcButton:(int)n{
    switch ([self num]) {
        case Integer:
            x=10*x+n;
            break;
            
        case Decimal:
            x=x+n*pow(10, -k);
            k++;
            break;
    }
    return x;
}

- (double)clearValue {
    x=0.0;
    buff=0.0;
    k=0;
    return x;
}

- (double)calcX:(double)cx{
    switch ([self calc]) {
        case Null:
            x=cx;
            break;
            
        case Plus:
            x=buff+cx;
            break;
            
        case Minus:
            x=buff-cx;
            break;
            
        case Multi:
            x=buff*cx;
            break;
            
        case Divide:
            x=buff/cx;
            break;
    }
    return x;
}

- (void)calcBuff:(double)cx{
    if (cx!=0) {
        switch ([self calc]) {
            case Null:
                buff=cx;
                break;
                
            case Plus:
                buff=buff+cx;
                break;
                
            case Minus:
                buff=buff-cx;
                break;
                
            case Multi:
                buff=buff*cx;
                break;
                
            case Divide:
                buff=buff/cx;
                break;
        }
    }
    x=0.0;
}

@end
