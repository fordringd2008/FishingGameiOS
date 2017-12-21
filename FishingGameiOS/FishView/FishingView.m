//
//  FishingView.m
//  FishingGameiOS
//
//  Created by DFD on 2017/12/20.
//  Copyright © 2017年 DF. All rights reserved.
//

#import "FishingView.h"
#import "GlobalDefine.h"
#import "UIView+Extension.h"
#import "FishHookView.h"

@interface FishingView()

@property (nonatomic, strong) FishHookView *fishHookView; //鱼钩

@property (nonatomic, assign) CGFloat angle; //鱼钩摆动角度

@end


@implementation FishingView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        
        [self initView];
    }
    return self;
}

- (void)initView{
    
//    [self initBgImageView];
    
    [self initHookView];
    
//    [self initFishView];
}

- (void)initHookView{
    
    _fishHookView = [[FishHookView alloc] initWithFrame:CGRectMake((ScreenWidth - 30)/2.0, 5, 30, 85)];
    __weak typeof(self) weakSelf = self;
    _fishHookView.angleBlock = ^(CGFloat angle) {
        weakSelf.angle = angle;
    };
    [self addSubview:_fishHookView];
    
    UIImageView *yuGanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2.0 - 2, 0, ScreenWidth/2.0, 50)];
    yuGanImageView.image = [UIImage imageNamed:@"fish_gan_tong"];
    [self addSubview:yuGanImageView];
}

- (void)removeFishViewResource{
    
    //释放鱼钩的计时器
    [self.fishHookView hoolTimerInvalidate];
    
}

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass(self.class));
}

@end
