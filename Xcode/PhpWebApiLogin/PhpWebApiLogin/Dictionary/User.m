/*
 User.m
 
 Developed by Franz Ayestaran on 10/6/15.
 Copyright (c) 2022 CodeMunkeys All rights reserved.
 
 You may use this code in your own projects and upon doing so, you the programmer are solely
 responsible for determining it's worthiness for any given application or task. Here clearly
 states that the code is for learning purposes only and is not guaranteed to conform to any
 programming style, standard, or be an adequate answer for any given problem.
*/

#import "User.h"

@implementation User

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@", [self status], [self userid], [self username], [self firstname], [self surname], [self email], [self phonenumber], [self photo], [self latitude], [self longitude], [self radius], [self unit]];
}

- (NSData *)convertToJSONData {
    
    // convert Task object to Foundation objects before attempting serialization
    NSMutableDictionary *newUser = [[NSMutableDictionary alloc] init];
    [newUser setObject:[self status] forKey:@"status"];
    [newUser setObject:[self userid] forKey:@"userid"];
    [newUser setObject:[self username] forKey:@"username"];
    [newUser setObject:[self firstname] forKey:@"firstname"];
    [newUser setObject:[self surname] forKey:@"surname"];
    [newUser setObject:[self email] forKey:@"email"];
    [newUser setObject:[self phonenumber] forKey:@"phonenumber"];
    [newUser setObject:[self photo] forKey:@"photo"];
    [newUser setObject:[self latitude] forKey:@"latitude"];
    [newUser setObject:[self longitude] forKey:@"longitude"];
    [newUser setObject:[self radius] forKey:@"radius"];
    [newUser setObject:[self unit] forKey:@"unit"];
    
    NSData *jsonData;
    
    // verify that object graph is serializable
    if ([NSJSONSerialization isValidJSONObject:newUser]) {
        NSError* jsonError;
        // convert Foundation objects to an NSData object containing JSON
        jsonData = [NSJSONSerialization dataWithJSONObject:newUser options:NSJSONWritingPrettyPrinted error:&jsonError];
    }
    
    return jsonData;
}

@end
