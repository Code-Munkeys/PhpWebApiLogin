/*
 LoginViewController.m
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2015 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "WebAPI.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

User* UserLoginDetails;

@synthesize txtUsername, txtPassword, btnSignIn;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [[btnSignIn layer] setBorderWidth:2.0f];
    [[btnSignIn layer] setBorderColor:[UIColor blackColor].CGColor];
    btnSignIn.layer.cornerRadius=10.0f;
    btnSignIn.layer.borderWidth=1.0f;
    
    [[txtUsername layer] setBorderWidth:2.0f];
    [[txtUsername layer] setBorderColor:[UIColor blackColor].CGColor];
    UIView *txtUsernameIndent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [txtUsername setLeftViewMode:UITextFieldViewModeAlways];
    [txtUsername setLeftView:txtUsernameIndent];
    txtUsername.layer.cornerRadius=10.0f;
    txtUsername.layer.borderWidth=1.0f;
    
    [[txtPassword layer] setBorderWidth:2.0f];
    [[txtPassword layer] setBorderColor:[UIColor blackColor].CGColor];
    UIView *txtPasswordIndent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [txtPassword setLeftViewMode:UITextFieldViewModeAlways];
    [txtPassword setLeftView:txtPasswordIndent];
    txtPassword.layer.cornerRadius=10.0f;
    txtPassword.layer.borderWidth=1.0f;
    
    // Get the stored credentials
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    txtUsername.text = [defaults objectForKey:@"Username"];
    txtPassword.text = [defaults objectForKey:@"Password"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Go-Profile"])
    {
        ProfileViewController *Profile = segue.destinationViewController;
        Profile.PushThroughSegue = UserLoginDetails;
    }
}

-(void)SignIn
{
    if ((txtUsername.text.length > 0) && (txtPassword.text.length > 0))
    {
            UserLoginDetails = [WebAPI WebApiLogin:txtUsername.text password:txtPassword.text];
            
            NSString *LoginStatus = [NSString stringWithFormat:@"%@",UserLoginDetails.status];
            
            NSLog(@"Login Status: '%@'",LoginStatus);
            
            if ([LoginStatus  isEqual: @"1"])
            {
                // Store credentials
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
                [defaults setObject:txtUsername.text forKey:@"Username"];
                [defaults setObject:txtPassword.text forKey:@"Password"];
                
                [defaults synchronize];
                
                NSLog(@"Data saved");
                
                [self performSegueWithIdentifier:@"Go-Profile" sender:self];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle: @"Sign In"
                                      message: @"Incorrect username and password combination"
                                      delegate: self
                                      cancelButtonTitle:nil
                                      otherButtonTitles:@"OK",nil];
                [alert show];
            }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Sign In"
                              message: @"Please enter a username and password"
                              delegate: self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK",nil];
        [alert show];
    }
}

- (IBAction)btnSignIn:(id)sender
{
    [self SignIn];
}

- (IBAction)gstHideKeyboard:(id)sender
{
    [txtUsername resignFirstResponder];
    [txtPassword resignFirstResponder];
}

- (IBAction)btnClear:(id)sender
{
    txtUsername.text = @"";
    txtPassword.text = @"";
    
    // Clear credentials
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:txtUsername.text forKey:@"Username"];
    [defaults setObject:txtPassword.text forKey:@"Password"];
    
    [defaults synchronize];

}

@end
