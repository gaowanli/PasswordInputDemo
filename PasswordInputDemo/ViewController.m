//
//  ViewController.m
//  PasswordInputDemo
//
//  Created by Gaowl on 15/4/27.
//  Copyright (c) 2015年 Gaowl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hiddenTextField;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_hiddenTextField becomeFirstResponder];
}

- (IBAction)textFieldEditingChanged:(UITextField *)textField
{
    NSString *passwordText = _hiddenTextField.text;// 当前输入的密码
    
    if (passwordText.length == _passwordTextField.count)
        [textField resignFirstResponder];// 输入完毕
    
    for (NSInteger i = 0; i < _passwordTextField.count; i++)
    {
        UITextField *textField = _passwordTextField[i];
        
        NSString *passwordChar;
        if (i < passwordText.length)
            passwordChar = [passwordText substringWithRange:NSMakeRange(i, 1)];
        textField.text = passwordChar;
    }
    if (passwordText.length == 4)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"输入的密码是" message:passwordText delegate:nil cancelButtonTitle:@"完成" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
