//
//  ViewController.m
//  Lesson27-TextFields
//
//  Created by Nick Bibikov on 11/27/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.loginField.keyboardAppearance = UIKeyboardAppearanceDark;
    //self.passwordField.keyboardAppearance = UIKeyboardAppearanceDark;

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - UITextFieldlaslopasswageteemte

/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
    
}


- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    return YES;
}
*/

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    self.emailCheckLabel.text = @"";
    
    return YES; }


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES; }


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.emailField]) {
        
        if ([self validateEmail:self.emailField.text]) {
            
            self.emailCheckLabel.text = @"Email right!";
            
        } else {
            
            self.emailCheckLabel.text = @"Please check email";
        }
    }
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self.backgroundView setFrame:CGRectMake(0,-60,CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds))];
                     } completion:^(BOOL finished) {
                         
                     }];
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3
                     animations:^{
                        [self.backgroundView setFrame:CGRectMake(0,0,CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds))];
                     }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.nameField]) {
        
        [self.emailField becomeFirstResponder];

    } else {
        
        [textField resignFirstResponder];
    }
    
    return YES;
}


- (BOOL)validateEmail:(NSString *)emailStr {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}


#pragma mark - Actins

- (IBAction)actionTextChanged:(UITextField *)sender {
    
    if (sender.tag == 0) {
        
        NSLog(@"Field login: %@", sender.text);
        
    } else {
        
        NSLog(@"Field password: %@", sender.text);
    }

    
}

- (IBAction)registerButton:(UIButton *)sender {
    
    NSLog(@"name is %@ | Email is %@", self.nameField.text, self.emailField.text);
    
    if ([self.nameField isFirstResponder]) {
        
        [self.nameField resignFirstResponder];
    } else if ([self.emailField isFirstResponder]) {
        
        [self.emailField resignFirstResponder];
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



#pragma mark - Notifications

- (void) notificationTextDidBeginEditing:(NSNotification*) notification {
 
    NSLog(@"notificationTextDidBeginEditing");
    
}

- (void) notificationTextDidEndEditing:(NSNotification*) notification {
    
    NSLog(@"notificationTextDidEndEditing");
}

- (void) notificationTextDidChange:(NSNotification*) notification {
    
    NSLog(@"notificationTextDidChange");
}


-(void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
