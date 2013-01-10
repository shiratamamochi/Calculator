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
    x=0.0;
    buff=0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNumber {
    if (x<pow(10, 15) && x>pow(10, -6)) {
        [[self Result] setText:[NSString stringWithFormat:@"%f", x]];
    }
    else{
        [[self Result] setText:[NSString stringWithFormat:@"%e", x]];
    }
}

//buttonN_method
- (void)buttonN {
    switch ([model num]) {
        case Integer:
            x=10*x+n;
            break;
            
        case Decimal:
            x=x+n*pow(10, -k);
            k++;
            break;
    }
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
    x=0.0;
    buff=0.0;
    [self setNumber];
}

- (IBAction)Clear:(id)sender {
    [model clearState:sender controller:self];
    [self clearNumber];
}

- (IBAction)Dot:(id)sender {
    [model Dot:sender controller:self];
    if ([model num] == Integer) {
        k=1;
    }
}

- (IBAction)Equal:(id)sender {
    switch ([model calc]) {
        case Null:
            break;
            
        case Plus:
            x=buff+x;
            break;
            
        case Minus:
            x=buff-x;
            break;
            
        case Multi:
            x=buff*x;
            break;
            
        case Divide:
            x=buff/x;
            break;
    }
    [self setNumber];

    [model setNum:Integer];
}

- (void)buffCalc {
    if (x!=0) {
        switch ([model calc]) {
            case Null:
                buff=x;
                break;
                
            case Plus:
                buff=buff+x;
                break;
                
            case Minus:
                buff=buff-x;
                break;
                
            case Multi:
                buff=buff*x;
                break;
                
            case Divide:
                buff=buff/x;
                break;
        }
    }
    
    [self setNumber];
    
    x=0.0;
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
