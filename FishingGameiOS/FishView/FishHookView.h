//
//  FishHookView.h
//  FishingGameiOS
//
//  Created by DFD on 2017/12/20.
//  Copyright © 2017年 DF. All rights reserved.
//  鱼钩视图

#import <UIKit/UIKit.h>

typedef void(^FishHookAngleBlock)(CGFloat angle);

@interface FishHookView : UIView

@property (nonatomic, copy  ) FishHookAngleBlock angleBlock;    // 获取鱼钩的角度

//计时器暂停
- (void)hookTimerPause;
//计时器继续
- (void)hoolTimerGoOn;

//计时器释放
- (void)hoolTimerInvalidate;

@end
