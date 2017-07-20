//
//  LYLoadingView.m
//  LoadingTest
//
//  Created by liyongjie on 2017/7/20.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import "YJLoadingView.h"
#import "UIImage+GIF.h"
@interface YJLoadingView()
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIImageView *gifImageView;
@end

@implementation YJLoadingView


-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageArr = [NSMutableArray array];
        self.frame = frame;
    }
    return self;
}
//图片数组
-(UIImageView *)imageView{
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width/7.0*10.0);
  
        for (int i=0; i<17; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refreshjoke_loading_%d", i % 17]];
            [self.imageArr addObject:image];
        }
        
        _imageView.animationDuration = 1.0;
        _imageView.animationRepeatCount = 0;
        _imageView.animationImages = self.imageArr;
    }
    return _imageView;
}
-(void)showLoadingImageInView:(UIView *)view{

    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    [view addSubview:self];
 
    [self addSubview:self.imageView];
    
    [self.imageView startAnimating];
    
}
-(void)dismissLoading{
    [_imageArr removeAllObjects];
    [_imageView stopAnimating];
    [_imageView removeFromSuperview];
    [self removeFromSuperview];
}


//动态图片
-(UIImageView *)gifImageView{

    if (_gifImageView == nil) {
        _gifImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width*3.0/4.0)];
 
        _gifImageView.image = [UIImage sd_animatedGIFNamed:@"loading"];
        
    }
    return  _gifImageView;
}
-(void)showGifLoadingInView:(UIView *)view{

    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    [view addSubview:self];
    
    [self addSubview:self.gifImageView];
}

-(void)dismissGifLoading{

    [_gifImageView removeFromSuperview];
    [self removeFromSuperview];
}


@end













