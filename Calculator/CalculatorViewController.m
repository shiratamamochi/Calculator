//
//  CalculatorViewController.m
//  Calculator
//
//  Created by 末松　崇章 on 12/10/23.
//  Copyright (c) 2012年 Takaaki Suematsu. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

@synthesize model;

- (void)viewDidLoad
{
    [super viewDidLoad];
    model=[[CalculatorStateMachine alloc] init];
    [model setNum:Integer];
    [model setCalc:Null];
	// Do any additional setup after loading the view, typically from a nib.
    
    [model setX: 0.0];
    [model setBuff:0.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNumber {
    if (cx<pow(10, 15) && cx>pow(10, -6)) {
        [[self Result] setText:[NSString stringWithFormat:@"%f", cx]];
    }
    else{
        [[self Result] setText:[NSString stringWithFormat:@"%e", cx]];
    }
}

//buttonN_method
- (void)buttonN {
    cx=[model calcButton:n];
    [self setNumber];
}

- (IBAction)Button0:(id)sender {
    n=0;
    [self buttonN];
}

- (IBAction)Button1:(id)sender {
    n=1;
    [self buttonN];
}

- (IBAction)Button2:(id)sender {
    n=2;
    [self buttonN];
}

- (IBAction)Button3:(id)sender {
    n=3;
    [self buttonN];
}

- (IBAction)Button4:(id)sender {
    n=4;
    [self buttonN];
}

- (IBAction)Button5:(id)sender {
    n=5;
    [self buttonN];
}

- (IBAction)Button6:(id)sender {
    n=6;
    [self buttonN];
}

- (IBAction)Button7:(id)sender {
    n=7;
    [self buttonN];
}

- (IBAction)Button8:(id)sender {
    n=8;
    [self buttonN];
}

- (IBAction)Button9:(id)sender {
    n=9;
    [self buttonN];
}

- (void)clearNumber {
    cx=[model clearValue];
    [self setNumber];
}

- (IBAction)Clear:(id)sender {
    [model clearState];
    [self clearNumber];
}

- (IBAction)Dot:(id)sender {
    [model setDecimal];
}

- (IBAction)Equal:(id)sender {
    cx=[model calcX:cx];
    [self setNumber];

    [model setNum:Integer];
}

- (void)buffCalc {
    [model calcBuff:cx];
    [self setNumber];
    cx=0;
}

- (IBAction)Plus:(id)sender {
    [self buffCalc];
    [model setNum:Integer];
    [model setCalc:Plus];
}

- (IBAction)Minus:(id)sender {
    [self buffCalc];
    [model setNum:Integer];
    [model setCalc:Minus];
}

- (IBAction)Multi:(id)sender {
    [self buffCalc];
    [model setNum:Integer];
    [model setCalc:Multi];
}

- (IBAction)Divide:(id)sender {
    [self buffCalc];
    [model setNum:Integer];
    [model setCalc:Divide];
}

@end
