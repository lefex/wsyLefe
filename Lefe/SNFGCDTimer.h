//
//  SNFGCDTimer.h
//  NavDemo
//
//  Created by WangSuyan on 2016/11/2.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNFGCDTimer : NSObject

- (void)startTimerWithBlock:(void(^)())complete;

- (void)cancelTimer;

@end
