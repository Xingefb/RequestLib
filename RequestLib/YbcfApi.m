//
//  YbcfApi.m
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "YbcfApi.h"
#import "ConstantStringHeader.h"

#import "YBapi.h"
#import "AFOAuth2Manager.h"

@implementation YbcfApi







+ (void)shareInstance {

    static YbcfApi *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
}

@end
