//
//  RequestBase.m
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "TokenOAuth.h"

#import "ConstantStringHeader.h"

#import "AFOAuth2Manager.h"
#import "AFHTTPSessionManager.h"


@implementation TokenOAuth

+ (BOOL )refreshToken {

    __block BOOL isSuccess;
    NSURL *baseUrl = [NSURL URLWithString:BaseUrl];
    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc] initWithBaseURL:baseUrl clientID:ClientID secret:Secret];
    AFOAuthCredential *OAuthCredential = [AFOAuthCredential retrieveCredentialWithIdentifier:serviceProviderIdentifier];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"" refreshToken:OAuthCredential.refreshToken success:^(AFOAuthCredential * _Nonnull credential) {
        isSuccess = YES;

    } failure:^(NSError * _Nonnull error) {
        isSuccess = NO;

    }];

    return isSuccess;

}

+ (BOOL )getTokenWithName:(NSString *)name andPassword:(NSString *)password {

    __block BOOL isSuccess;
    
    NSURL *baseUrl = [NSURL URLWithString:BaseUrl];
    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc] initWithBaseURL:baseUrl clientID:ClientID secret:Secret];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"" username:name password:password scope:nil success:^(AFOAuthCredential * _Nonnull credential) {
        [AFOAuthCredential storeCredential:credential withIdentifier:serviceProviderIdentifier];
        isSuccess = YES;
    } failure:^(NSError * _Nonnull error) {
        isSuccess = NO;
    }];
    
    return isSuccess;

}

+ (TokenOAuth *)instance {
    static TokenOAuth *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];

            
        }
    }

    return _instance;
}


@end
