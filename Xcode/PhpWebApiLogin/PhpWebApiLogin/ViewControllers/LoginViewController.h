/* 
 LoginViewController.h
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2015 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong, nonatomic) IBOutlet UIButton *btnSignIn;

- (IBAction)btnSignIn:(id)sender;

- (IBAction)gstHideKeyboard:(id)sender;

- (IBAction)btnClear:(id)sender;

@end
