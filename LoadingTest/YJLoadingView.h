//
//  LYLoadingView.h
//  LoadingTest
//
//  Created by liyongjie on 2017/7/20.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJLoadingView : UIView

//图片数组
-(void)showLoadingImageInView:(UIView *)view;
-(void)dismissLoading;


//动态图片
-(void)showGifLoadingInView:(UIView *)view;
-(void)dismissGifLoading;
@end
