//
//  FishHookView.m
//  FishingGameiOS
//
//  Created by DFD on 2017/12/20.
//  Copyright © 2017年 DF. All rights reserved.
//

#import "FishHookView.h"
#import "GlobalDefine.h"

@interface FishHookView()

@property (nonatomic, strong) CADisplayLink *linkTimer;
@property (nonatomic, assign) BOOL isReduce;//改变方向
@property (nonatomic, assign) CGFloat angle;//摆动的角度

@end


@implementation FishHookView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        
        [self initView];
    }
    return self;
}

- (void)initView{
    
    // 设置锚点
    [self setAnchorPoint:CGPointMake(0.5, 0) forView:self];
    
    // 鱼钩的宽高为 （30，35）
    UIImageView *gouImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 35 , 30, 35)];
    gouImageView.image = [UIImage imageNamed:@"fish_catcher_tong"];
    [self addSubview:gouImageView];
    
    // 鱼竿到鱼钩的默认距离为 35
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width - 3)/2.0, 0, 3, self.frame.size.height - 35)];
    lineView.backgroundColor = HEXCOLOR(0x9e664a);
    
    [self addSubview:lineView];
    
    _linkTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(hookMove)];
    [_linkTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

#pragma mark - 鱼钩摆动
- (void)hookMove{
    
    // 每次递增的角度
    // 在左右晃动的时候，向上时运动减慢，向下时速度加快
    CGFloat angleT = 1.8 * cos(1.5 * _angle) * 0.01;
    
    // 最大角度
    CGFloat maxAngle = M_PI / 180 * 45;
    /*
     鱼钩的摆动范围是[M_PI/4.0,-M_PI/4.0] (垂直向下为0度，顺时针为正)
     */
    // 
    if (self.isReduce){
        _angle -= angleT;
        if (_angle < -maxAngle){
            self.isReduce = NO;
        }
    }else{
        _angle += angleT;
        if (_angle > maxAngle){
            self.isReduce = YES;
        }
    }
    
    // 回调
    if (self.angleBlock){
        self.angleBlock(_angle);
    }
    
    // 设置旋转角度
    self.transform = CGAffineTransformMakeRotation(_angle);
}


//设置锚点后重新设置frame，使锚点立即生效
- (void) setAnchorPoint:(CGPoint)anchorpoint forView:(UIView *)view{
    CGRect frame = view.frame;
    view.layer.anchorPoint = anchorpoint;
    view.frame = frame;
}


//计时器暂停
- (void)hookTimerPause{
    self.linkTimer.paused = YES;
}
//计时器继续
- (void)hoolTimerGoOn{
    self.linkTimer.paused = NO;
}

//计时器释放
- (void)hoolTimerInvalidate{
    [self.linkTimer invalidate];
}

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass(self.class));
}


@end
