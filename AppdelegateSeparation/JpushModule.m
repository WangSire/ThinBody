//
//  JpushModule.m
//  AppdelegateSeparation
//
//  Created by Siri on 2019/3/11.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "JpushModule.h"

@implementation JpushModule
@synthesize index;
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.index = 1;
    });
    
    NSLog(@"jpushModel 执行了");
    return YES;
}
-(void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"%s",__func__);
}
@end
