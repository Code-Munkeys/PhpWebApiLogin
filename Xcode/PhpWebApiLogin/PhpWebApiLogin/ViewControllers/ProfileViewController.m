/*
 ProfileViewController.h
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2022 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize PushThroughSegue, txtFirstName, txtSurname, txtEmail, txtPhoneNumber, imgPhoto;

- (UIImage *)stringToUIImage:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    return [UIImage imageWithData:data];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Profile PushThroughSegue: %@",PushThroughSegue);    
    User *Profile = PushThroughSegue;
    
    txtFirstName.text = Profile.firstname;
    txtSurname.text = Profile.surname;
    txtEmail.text = Profile.email;
    txtPhoneNumber.text = Profile.phonenumber;
    
    //data:image/png;base64,
    imgPhoto.image = [self stringToUIImage:Profile.photo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
