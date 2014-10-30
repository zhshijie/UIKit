//
//  UIKitPrjScrollPaging.m
//  scrollViewAndpageControllDemo
//
//  Created by sky on 14-6-9.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "UIKitPrjScrollPaging.h"

@interface UIKitPrjScrollPaging ()

@end

@implementation UIKitPrjScrollPaging

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"ScrollPaging测试";
    self.view.backgroundColor = [UIColor blackColor];
    
    //初始化UIScrollView及UIPageControll实例，为了给UIPageControl控件留显示位置。将起点坐标定为（0，344）
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,100, 320, 245)];
    
    page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 444, 320, 36)];
    //初始化图片文件名数组
    images = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    //将UIScrollView及UIPageControll实例追加到画面中
    
    [self.view addSubview:scrollView];
    [self.view addSubview:page];
    [self setupPage];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupPage
{
    //设置UIScrollView实例中的各种显示特性
    //设置委托类为自身，其中实现UISCROllViewDelegate协议中定义的scrollViewDidscroll：及scrooViewDidEndDeclerating：方法
    
    scrollView.delegate = self;
    [scrollView setBackgroundColor:[UIColor blackColor]];
    [scrollView setCanCancelContentTouches:NO];
    //设置滚条类型
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.clipsToBounds = YES;
    scrollView.scrollEnabled = YES;
    //只有pagingEnabled为YES时才可以进行画面切换
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = NO;
    //隐藏滚动条设置
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    //页面的扩大和缩小
    
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 3.0;
    scrollView.minimumZoomScale = 0.1;
    
     
     
    NSInteger nimages = 0;
    CGFloat cx = 0;
    for (NSString *imagePath in images) {
        //  初始化图片的UII马哥 View实例
        UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectZero];
        //设置背景
        [imageView setBackgroundColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]];
        //  导入图片
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageView setImage:img];
        
        //设置UIImageView实例位置，及UIImageView实例frame属性值
        CGRect rect = scrollView.frame;
        rect.size.height = scrollView.frame.size.height;
        rect.size.width = scrollView.frame.size.width;
        rect.origin.x = cx;
        rect.origin.y = 0;
        imageView.frame = rect;
        //将图片内容的显示模式设置为自适应模式
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        [scrollView addSubview:imageView];
        //移动左边准备下一张图片
        cx += 320;
        nimages++;
    }
    
    //注册UIPageControll实例响应方法
    [page addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    //设置总页数
    page.numberOfPages = nimages;
    
    page.currentPage = 0;
    page.tag = 0;
    
    //重置UIScrollView的尺寸
    [scrollView setContentSize:CGSizeMake(cx, [scrollView bounds].size.height)];
    
}



//扩大和缩小功能
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)_scrollView
{
    for (id subview in _scrollView.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            return subview;
        }
    }
    return nil;
}


//实现UIScrollViewDelegate中定义的状态监视方法
//滚动时调用的方法，其中判断画面滚动时机
-(void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if(pageControlIsChangingPage)
        return;
    
    /*
     画面拖动超过50％时进行切换
     */
    CGFloat pageWidth = _scrollView.frame.size.width;
    int pageofint = floor((_scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    
    page.currentPage = pageofint;
}


//滚动完成调用方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlIsChangingPage = NO;
}

//UIPageContrll实例的响应方法
-(void)changePage:(id)sender
{
    CGRect frame = scrollView.frame;
    frame.origin.x
    = frame.size.width*page.currentPage;
    frame.origin.y = 0;
    // 调用UIScrollView的scrollRectToVisible：animated：方法实现画面切换
    [scrollView scrollRectToVisible:frame animated:YES];
    //设置滚动标志，滚动完成时，会调用scroll ViewDidEndDeceleratin方法，其中会将其置为off
    pageControlIsChangingPage = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
