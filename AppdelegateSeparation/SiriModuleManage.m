//
//  SiriModuleManage.m
//  AppdelegateSeparation
//
//  Created by Siri on 2019/3/11.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "SiriModuleManage.h"

@interface SiriModuleManage()
@property (nonatomic ,strong)NSMutableArray *moduleArr;
@end

@implementation SiriModuleManage
static SiriModuleManage *manage = nil;
+(instancetype)sharedInstancetype{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage = [[self alloc]init];
    });
    return manage;
}

-(void)loadModulesWithArray:(NSArray *)array{
    for (NSString *moduleName in array) {
        id<SiriModule> module = [[NSClassFromString(moduleName) alloc] init];
        [self addModule:module];
    }
}
-(void)addModule:(id<SiriModule>)module{
    if (![self.moduleArr containsObject:module]) {
        [self.moduleArr addObject:module];
    }
}

-(NSArray<id<SiriModule>> *)allModules{
     return self.moduleArr;
}



#pragma mark Appdelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    for (id<SiriModule> module in self.moduleArr) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    for (id<SiriModule> module in self.moduleArr) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillResignActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    for (id<SiriModule> module in self.moduleArr) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    for (id<SiriModule> module in self.moduleArr) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillEnterForeground:application];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    for (id<SiriModule> module in self.moduleArr) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    for (id<SiriModule> module in self.moduleArr) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillTerminate:application];
        }
    }
}
-(NSInteger)obtainTotal{
    int total = 0;
    for (id<SiriModule> module in self.moduleArr) {
        total += module.index;
    }
    return total;
}

-(NSMutableArray *)moduleArr{
    if (!_moduleArr) {
        _moduleArr = [NSMutableArray array];
    }
    return _moduleArr;
}
@end
