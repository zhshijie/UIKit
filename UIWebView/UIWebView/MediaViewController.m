//
//  MediaViewController.m
//  UIWebView
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MediaViewController.h"

@interface MediaViewController ()

{
    UIWebView *_webView;
}
@end

@implementation MediaViewController

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
    _webView = [[UIWebView alloc]init];
    _webView.frame = self.view.frame;
    _webView.scalesPageToFit = YES;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_webView];
    
    
    //JPEG照片显示
    /*
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    if (path) {
//        NSData *data = [NSData dataWithContentsOfFile:path];
//        [_webView loadData:data MIMEType:@"jmage/jpeg" textEncodingName:nil baseURL:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *urlrequest = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:urlrequest];
    }
    else{
        NSLog(@"file not found");
    }
     */
    
    //PDF文件显示
    /*
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Procedure to configure Mac to support Universities WiFi | Information Technology" ofType:@"pdf"];
    if (path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
     */
    
    //HTML字符的指
    _webView.dataDetectorTypes =UIDataDetectorTypeAll;
    NSString *html =@"<b>[电话号码]</b><br />"
                     "090-0000-0000<hr />"
                     "<b>[主页]</b><br />"
                     "http://www.apple.com/";
    [_webView loadHTMLString:html baseURL:nil];
   
    _webView.delegate = self;
}

-(BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(UIWebViewNavigationTypeLinkClicked==navigationType)
    {
        NSLog(@"UIWebViewNavigationTypeLinkClicked");
    }
    
    return TRUE;
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
