//
//  AdvertisingModule.m
//  AppdelegateSeparation
//
//  Created by Siri on 2019/3/11.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "AdvertisingModule.h"

@implementation AdvertisingModule
@synthesize index;
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.index = 2;
    NSLog(@"AdvertisingModule 执行了");
    return YES;
}



@end
