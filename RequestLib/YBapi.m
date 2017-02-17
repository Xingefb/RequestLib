//
//  YBapi.m
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "YBapi.h"

#import "ConstantStringHeader.h"
#import "AFOAuth2Manager.h"
@implementation YBapi

- (instancetype)initWithBaseURL:(NSURL *)url {
    
    if (self = [super initWithBaseURL:url]) {
        
        AFOAuthCredential *Credential = [AFOAuthCredential retrieveCredentialWithIdentifier:serviceProviderIdentifier];
        if (Credential) {
            [self.requestSerializer setAuthorizationHeaderFieldWithCredential:Credential];
        }
        self.requestSerializer.timeoutInterval = TimeOut;
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
        [self.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
        [self.requestSerializer setValue:[NSString stringWithFormat:@"%@", [[NSLocale preferredLanguages] componentsJoinedByString:@","]] forHTTPHeaderField:@"Accept-Language"];
        
    }
    return self;
}

+ (instancetype)sharedManager {
    static YBapi *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
    });
    return manager;
}

@end
