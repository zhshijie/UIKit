//
//  scrollViewController.m
//  scrollView
//
//  Created by sky on 14-6-7.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "scrollViewController.h"
#import "MyViewController.h"

@interface scrollViewController ()

@end

@implementation scrollViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


static const NSInteger kNumberOfPages =10;
static const NSInteger kViewheight = 480;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ScrollView的初始化
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    //scrollVier中设置图片
    
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.bounds.size;

    
    //扩大和缩小
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 0.1;
    scrollView.maximumZoomScale = 3.0;
    
    //为了能进行画面横向翻滚，设置内容的横向长度
    
    /*
    scrollView.contentSize = CGSizeMake(320*kNumberOfPages, kViewheight);
    
    //页单位的滚动
    scrollView.pagingEnabled = YES;
    //隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    //关闭滚到顶部
    scrollView.scrollsToTop = NO;
    
    //将各画面追加到scrollView
    for (int i=0; i<kNumberOfPages; ++i) {
        MyViewController *myViewController = [MyViewController myViewControllerWithNumber:i];
        myViewController.view.frame = CGRectMake(320*i, 0, 320, kViewheight);
        [scrollView addSubview:myViewController.view];
    }
     */
    
    //ScrollView追加到主画面中
    [self.view addSubview:scrollView];
    
    // Do any additional setup after loading the view.
}

//扩大和缩小
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    for (id subView in scrollView.subviews) {
        if([subView isKindOfClass:[UIImageView class]])
            return  subView;
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate

//滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

//开始滑动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

//结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

//开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

//减速结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollVie
{
    NSLog(@"scrollViewDidEndDecelerating");
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
