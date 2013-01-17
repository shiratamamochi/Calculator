//
//  CalculatorViewController.h
//  Calculator
//
//  Created by 末松　崇章 on 12/10/23.
//  Copyright (c) 2012年 Takaaki Suematsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorStateMachine.h"

@interface CalculatorViewController : UIViewController {
    double cx;       //Inputed number
    int n;
}
@property (weak, nonatomic) IBOutlet UILabel *Result;

@property CalculatorStateMachine* model;

-(void)setNumber;
-(void)clearNumber;
-(void)buffCalc;


- (IBAction)Button0:(id)sender;
- (IBAction)Button1:(id)sender;
- (IBAction)Button2:(id)sender;
- (IBAction)Button3:(id)sender;
- (IBAction)Button4:(id)sender;
- (IBAction)Button5:(id)sender;
- (IBAction)Button6:(id)sender;
- (IBAction)Button7:(id)sender;
- (IBAction)Button8:(id)sender;
- (IBAction)Button9:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)Dot:(id)sender;
- (IBAction)Equal:(id)sender;
- (IBAction)Plus:(id)sender;
- (IBAction)Minus:(id)sender;
- (IBAction)Multi:(id)sender;
- (IBAction)Divide:(id)sender;

@end
