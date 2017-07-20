//
//  ViewController.m
//  LoadingTest
//
//  Created by liyongjie on 2017/7/20.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import "ViewController.h"
#import "YJLoadingView.h"
#import "AFNetworking.h"
@interface ViewController ()
@property (nonatomic,strong)YJLoadingView *loadingView;
@property (nonatomic,strong)YJLoadingView *gifLoadView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置加载图片数组还是gif动图
    
    NSArray *arr = @[@1,@2];
    NSInteger num = [[arr objectAtIndex:arc4random()%arr.count]integerValue];
    NSLog(@"%ld",num);
    if (num == 1) {
        [self showLoading];
    }else{
    
        [self showGifLoading];
    }
    
    
    //设置三秒后开始加载数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self requestData];

    });
}

-(void)requestData{
    __weak typeof(self) weakSelf = self;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://v.juhe.cn/toutiao/index?type=top&key=160f6a145f32d7c5410a2437923e01ea" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (weakSelf.loadingView && !weakSelf.gifLoadView) {
            [weakSelf.loadingView dismissLoading];
        }else if(!weakSelf.loadingView && weakSelf.gifLoadView){
            [weakSelf.gifLoadView dismissGifLoading];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}

-(void)showLoading{
    YJLoadingView *view = [[YJLoadingView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.width/2)];
    _loadingView = view;
    [view showLoadingImageInView:self.view];
    view.center = self.view.center;
    [self.view bringSubviewToFront:view];
}
 
-(void)showGifLoading{
    YJLoadingView *view = [[YJLoadingView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.width/2)];
    _gifLoadView = view;
    view.center = self.view.center;
    
    [view showGifLoadingInView:self.view];
    [self.view bringSubviewToFront:view];
    
 
}

@end
