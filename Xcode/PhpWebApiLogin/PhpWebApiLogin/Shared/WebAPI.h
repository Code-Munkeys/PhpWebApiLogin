/*
 WebApi.h
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2015 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "User.h"

@interface WebAPI : NSObject

@property (strong, nonatomic) id detailItem;

+(NSString*)EncryptCredentials:(NSString *)UsernamePassword;

+(User*)WebApiLogin:(NSString*)login password:(NSString*)password;

extern NSString *CodeMunkeysWebAPIservice;
extern NSString *BasicAuthenticationCredentials;
extern int LoginSuccess;
@end
