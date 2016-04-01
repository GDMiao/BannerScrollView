//
//  BannerScrollView.h
//  BannerScrollView
//
//  Created by miaoguodong on 16/3/31.
//  Copyright © 2016年 miaoguodong. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 遵循该代理就可以监控到网络滚动视图的index*/

@protocol BannerScrollNetDelegate <NSObject>

@optional

/** 点中网络滚动视图后触发*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index;

@end

/** 遵循该代理就可以监控到本地滚动视图的index*/

@protocol BannerScrollLocalDelegate <NSObject>

@optional

/** 点中本地滚动视图后触发*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index;

@end

typedef enum{
    pageLeft = 0,
    pageCenter,
    pageRight,
    
}PageStyle;

@interface BannerScrollView : UIView

@property (assign, nonatomic) PageStyle pagestyle;
/** 选中网络图片的索引*/
@property (nonatomic, strong) id <BannerScrollNetDelegate> netDelagate;

/** 选中本地图片的索引*/
@property (nonatomic, strong) id <BannerScrollLocalDelegate> localDelagate;

/** 占位图*/
@property (nonatomic, strong) UIImage *placeholderImage;

/** 滚动延时*/
@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;

/**
 *  本地图片
 *
 *  @param frame      位置
 *  @param imageArray 加载本地图片
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithLocalImages:(NSArray *)imageArray;

/**
 *  加载网络图片
 *
 *  @param frame      位置大小
 *  @param imageArray 名字
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithNetImages:(NSArray *)imageArray;
@end
