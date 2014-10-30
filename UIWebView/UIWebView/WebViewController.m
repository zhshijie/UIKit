//
//  WebViewController.m
//  UIWebView
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

{
    UIActivityIndicatorView *_activity;
    UIWebView *_webView;
    UIBarButtonItem *_reloadButton;
    UIBarButtonItem *_backButton;
    UIBarButtonItem *_stopButton;
    UIBarButtonItem *_forwardButton;
}
@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
     if (self) {
     }
    return self;
}

//通常不会讲UIWebView 放在viewDidLoad中
-(void)viewDidAppear:(BOOL)animated
{
    //画面加载显示后加载Web页面
    [super viewDidAppear:animated];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [_webView loadRequest:request];
    [self updateViewConstraints];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIWebView的创建／初始化与设置
    _webView = [[UIWebView alloc]init];
    _webView.delegate = self;
    _webView.frame = self.view.frame;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _webView.scalesPageToFit = YES;
    //支持页面自动收缩
    [self.view addSubview:_webView];
    
    //在工具条中添加活动指示器
    _activity = [[UIActivityIndicatorView alloc]init];
    _activity.frame = CGRectMake(0, 0, 20, 20);
    UIBarButtonItem *indicator = [[UIBarButtonItem alloc]initWithCustomView:_activity];
    UIBarButtonItem *adjustment =[ [UIBarButtonItem alloc]initWithBarButtonSystemItem:    UIBarButtonSystemItemFlexibleSpace target:nil action:nil
];
    
    _reloadButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadDidPush)];
    _stopButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopDidPush)];

    _backButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backDidPush)];
    _forwardButton = [[UIBarButtonItem alloc]initWithTitle:@"Forward" style:UIBarButtonItemStyleBordered target:self action:@selector(forwardDidPush)];
    
    
    
    NSArray *buttons = [NSArray arrayWithObjects:adjustment,_backButton,adjustment,_forwardButton,adjustment,indicator,adjustment,_reloadButton,adjustment,_stopButton,adjustment, nil];
    [self setToolbarItems:buttons animated:YES];
}

//重新加载视图
-(void)reloadDidPush
{
    [_webView reload];
}

//前进
-(void)forwardDidPush
{
    if (_webView.canGoForward) {
        [_webView goForward];
    }
}

//停止
-(void)stopDidPush
{
    if (_webView.loading) {
        [_webView stopLoading];
    }
}

//返回
-(void)backDidPush
{
    if (_webView.canGoBack) {
        [_webView goBack];
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self updateViewConstraints];
    [_activity startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [_activity stopAnimating];
    [self updateViewConstraints];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self updateViewConstraints];
    [_activity stopAnimating];
}
-(void)dealloc
{
    if (_webView.loading) {
        [_webView stopLoading];
    }
}

-(void)updateViewConstraints
{
    //统一更新按钮指示状态
    [UIApplication sharedApplication].networkActivityIndicatorVisible = _webView.loading;
    _stopButton.enabled = _webView.loading;
    _backButton.enabled = _webView.canGoBack;
    _forwardButton.enabled = _webView.canGoForward;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
