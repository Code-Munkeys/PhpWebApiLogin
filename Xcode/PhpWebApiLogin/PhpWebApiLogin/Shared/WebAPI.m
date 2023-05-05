/*
 WebApi.m
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2022 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
 */

#import "WebAPI.h"

@interface WebAPI ()

@end

@implementation WebAPI

NSString *BasicAuthenticationCredentials = @"guestuser:L3tm31n.";
NSString *CodeMunkeysWebAPIservice = @"https://secure.codemunkeys.co.uk/phpwebapilogin/";

+(NSString*)EncryptCredentials:(NSString *)UsernamePassword
{
    NSString *decodeString = UsernamePassword;
    //Encode String
    NSData *encodeData = [decodeString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
    return base64String;
}

+(User*)WebApiLogin:(NSString*)login password:(NSString*)password
{
    User* UserLoginDetails;
    NSString *voiEncryptedCredentials = [self EncryptCredentials:BasicAuthenticationCredentials];
    NSLog(@"voiEncryptedCredentials: %@", voiEncryptedCredentials);
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@login.php",CodeMunkeysWebAPIservice]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setValue:[@"Basic " stringByAppendingString:voiEncryptedCredentials] forHTTPHeaderField:@"Authorization"];
    NSString *post = [NSString stringWithFormat:@"&z1=%@&z2=%@",login,password];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSLog(@"Request: %@", request);
    
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    if (data != nil)
    {
        NSError* jsonError;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        
        if(nil != jsonError)
        {
            NSLog(@"Error: %@", jsonError);
        }
        else
        {
            if (json) {
                
                for (NSDictionary* jsonDict in json) {
                    
                    User *user = [[User alloc] init];
                    [user setStatus:[jsonDict objectForKey:@"status"]];
                    [user setUserid:[jsonDict objectForKey:@"userid"]];
                    [user setUsername:[jsonDict objectForKey:@"username"]];
                    [user setFirstname:[jsonDict objectForKey:@"firstname"]];
                    [user setSurname:[jsonDict objectForKey:@"surname"]];
                    [user setEmail:[jsonDict objectForKey:@"email"]];
                    [user setPhonenumber:[jsonDict objectForKey:@"phonenumber"]];
                    [user setPhoto:[jsonDict objectForKey:@"photo"]];
                    [user setLatitude:[jsonDict objectForKey:@"latitude"]];
                    [user setLongitude:[jsonDict objectForKey:@"longitude"]];
                    [user setRadius:[jsonDict objectForKey:@"radius"]];
                    [user setUnit:[jsonDict objectForKey:@"unit"]];
                    
                    UserLoginDetails = user;
                }
            }
            else {
                NSLog(@"An error occurred: %@", jsonError);
            }
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Login"
                              message: @"Could not connect to server!"
                              delegate: self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK",nil];
        [alert show];
    }
    
    return UserLoginDetails;
}

@end
