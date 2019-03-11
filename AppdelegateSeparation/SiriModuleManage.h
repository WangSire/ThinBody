//
//  SiriModuleManage.h
//  AppdelegateSeparation
//
//  Created by Siri on 2019/3/11.
//  Copyright © 2019年 Siri. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>
@protocol SiriModule <UIApplicationDelegate>
@property (nonatomic, assign)int index;
@end

@interface SiriModuleManage : NSObject<UIApplicationDelegate>
+(instancetype)sharedInstancetype;
- (void)loadModulesWithArray:(NSArray *)array;
- (NSArray<id<SiriModule>> *)allModules;

//获取两个model中初始化的数据
- (NSInteger)obtainTotal;
@end
