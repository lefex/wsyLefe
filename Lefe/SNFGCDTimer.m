//
//  SNFGCDTimer.m
//  NavDemo
//
//  Created by WangSuyan on 2016/11/2.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

#import "SNFGCDTimer.h"


dispatch_source_t CreateDispatchTimer(double interval, dispatch_queue_t queue, dispatch_block_t block)
{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    if (timer)
    {
        dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC), interval * NSEC_PER_SEC, (1ull * NSEC_PER_SEC) / 10);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);
    }
    return timer;
}

@interface SNFGCDTimer ()
{
    dispatch_source_t _timer;
}

@end

@implementation SNFGCDTimer

- (void)startTimerWithBlock:(void(^)())complete
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    double secondsToFire = 1.000f;
    
    _timer = CreateDispatchTimer(secondsToFire, queue, ^{
        
        complete ? complete() : nil;
    });
}

- (void)cancelTimer
{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

@end
