/*
 User.h
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2022 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phonenumber;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *radius;
@property (nonatomic, strong) NSString *unit;

/* Embedded Test Data
 
 [{"status":1,"username":"GuestUser","firstname":"Guest","surname":"User","email":"guest@user.com","phonenumber":"01234567890","photo":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAASUAAAEVCAYAAACmHfPaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAADa2SURBVHhe7d1ZrzRXdf\/xJhN4wiM2tokxNmBjQxQHI8URICFBcpHbvKUoyk1eRy5yFymDkighECDEJpDYDLbjAY+AJ0xsyPj\/8ynn97C86T7nOc\/p6lPdZ32lraratau69qpav1p7167qd\/y\/n7JqmqZZCL\/wf9OmaZpF0KLUNM2iaFFqmmZRtCg1TbMoWpSaplkULUpN0yyKFqWmaRZFi9I5Ze7haUftv4fGNUfRonTgbBKAd7zjHf83d3GcVEjW7T","latitude":"0","longitude":"0","radius":"100","unit":"metric"}]
 */

- (NSData *)convertToJSONData;

@end
