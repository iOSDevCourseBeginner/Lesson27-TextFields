//
//  ViewController.h
//  Lesson27-TextFields
//
//  Created by Nick Bibikov on 11/27/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *emailCheckLabel;

- (IBAction)actionTextChanged:(UITextField *)sender;
- (IBAction)registerButton:(UIButton *)sender;

@end

