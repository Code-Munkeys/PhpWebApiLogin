/*
 ProfileViewController.h
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2022 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import <UIKit/UIKit.h>
#import "User.h"

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) User *PushThroughSegue;

@property (strong, nonatomic) IBOutlet UIImageView *imgPhoto;

@property (strong, nonatomic) IBOutlet UILabel *txtFirstName;

@property (strong, nonatomic) IBOutlet UILabel *txtSurname;

@property (strong, nonatomic) IBOutlet UILabel *Username;

@property (strong, nonatomic) IBOutlet UILabel *txtEmail;

@property (strong, nonatomic) IBOutlet UILabel *txtPhoneNumber;

@end
