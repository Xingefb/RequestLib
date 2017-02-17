//
//  RequestBase.h
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TokenOAuth : NSObject

+ (BOOL )getTokenWithName:(NSString *)name andPassword:(NSString *)password;

+ (BOOL )refreshToken;

+ (TokenOAuth *)instance;


@end
