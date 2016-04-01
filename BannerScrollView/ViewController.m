//
//  ViewController.m
//  BannerScrollView
//
//  Created by miaoguodong on 16/3/31.
//  Copyright © 2016年 miaoguodong. All rights reserved.
//

#import "ViewController.h"
#import "BannerScrollView.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<BannerScrollNetDelegate,BannerScrollLocalDelegate>
/** 网络图片数组*/
@property(nonatomic,strong)NSArray *NetImageArray;

/** 本地图片数组*/
@property(nonatomic,strong)NSArray *localImageArray;
@end

@implementation ViewController
-(NSArray *)NetImageArray
{
    if(!_NetImageArray)
    {
        _NetImageArray = @[@"http://pic2.ooopic.com/10/57/50/93b1OOOPIC4d.jpg",@"http://pic2.ooopic.com/10/55/16/14b1OOOPIC4d.jpg",@"http://pic2.ooopic.com/10/78/82/94b1OOOPIC84.jpg",@"http://pic2.ooopic.com/10/78/93/40b1OOOPIC59.jpg"];
    }
    return _NetImageArray;
}

-(NSArray *)localImageArray
{
    if(!_localImageArray)
    {
        _localImageArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    }
    return _localImageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    /** 创建网络滚动视图*/
    [self createNetScrollView];
//
    /** 创建本地滚动视图*/
    [self createLocalScrollView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createNetScrollView
{
    /** 设置网络scrollView的Frame及所需图片*/
    BannerScrollView *NetScrollView = [[BannerScrollView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200) WithNetImages:self.NetImageArray];
    
    /** 设置滚动延时*/
    NetScrollView.AutoScrollDelay = 3;
    
    /** 设置占位图*/
    NetScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    
    
    /** 获取网络图片的index*/
    NetScrollView.netDelagate = self;
    
    /** 添加到当前View上*/
    [self.view addSubview:NetScrollView];
    
}

-(void)createLocalScrollView
{
    /** 设置本地scrollView的Frame及所需图片*/
    BannerScrollView *LocalScrollView = [[BannerScrollView alloc]initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 200) WithLocalImages:self.localImageArray];
    
    /** 设置滚动延时*/
    LocalScrollView.AutoScrollDelay = 2;
    
    /** 获取本地图片的index*/
    LocalScrollView.localDelagate = self;
    
    /** 设置占位图*/
    LocalScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    /** 添加到当前View上*/
    [self.view addSubview:LocalScrollView];
}

/** 获取网络图片的index*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index
{
    NSLog(@"点中网络图片的下标是:%ld",(long)index);
}

/** 获取本地图片的index*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index
{
    NSLog(@"点中本地图片的下标是:%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
