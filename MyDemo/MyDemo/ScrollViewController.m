//
//  RootViewController.m
//  UIscrollPhotoDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "ScrollViewController.h"
#import "ImageScrollView.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

const int screenHight=568;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        kPage = 1;
        imageArray = [[NSMutableArray alloc]initWithCapacity:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //隐藏导航栏和工具拦
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.toolbarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 340, screenHight)];
    _scrollView.contentSize = CGSizeMake(340*kPage, screenHight);
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.tag = INT16_MAX;
    
    
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidNavigation)] autorelease];
    tap.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tap];
    
    UITapGestureRecognizer *doubTap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:NULL] autorelease];
    doubTap.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:doubTap];
    
    [tap requireGestureRecognizerToFail:doubTap];//区分单击和双击
    
    
    //设置代理
    _scrollView.delegate = self;
    
    //加载图片
    for (int i=1; i<=4; i++)
    {
    ImageScrollView *imageScrollView = [[[ImageScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, screenHight)] autorelease];
    NSString *imageName  = [NSString stringWithFormat:@"%d.png",i];
    imageScrollView.imageView.image = [UIImage imageNamed:imageName];
    imageScrollView.tag = 0;
    [imageArray addObject:imageScrollView];
    }
    
    //加载图片
    [self updateImage];
    
    //添加图片
    UIBarButtonItem *addImageButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addImage:)];
    
    //删除图片
    UIBarButtonItem *deleImageButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(deleImage:)];
    self.navigationItem.rightBarButtonItems = @[addImageButton,deleImageButton];

    [self.view addSubview:_scrollView];
    
}


//更新显示视图
-(void)updateImage
{
    int _x = 0;
    
    //删除子视图
    for (UIView * subview in [_scrollView subviews]) {
        if([subview isKindOfClass:[UIImageView class]]) continue;//这是为了防止滚动条被移除;
        [subview removeFromSuperview];
    }
    if ([imageArray count]==0) {
        //提示已经没有图片。
        _scrollView.contentSize = CGSizeMake(340, screenHight);
        UILabel *label = [[UILabel alloc]init];
        label.text = @"没有图片";
        label.frame = CGRectMake(0, 0, 320, screenHight);
        //        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentCenter;
        [_scrollView addSubview:label];
        [label release];
        return;
    }
    
    //重新加载子视图
    _scrollView.contentSize = CGSizeMake(340*[imageArray count], screenHight);
    for (int index = 0; index < [imageArray count]; index++) {
        ImageScrollView *imageScrollView2 = [imageArray objectAtIndex:index];
        imageScrollView2.frame = CGRectMake(_x, 0, 320, screenHight);
        [_scrollView addSubview:imageScrollView2];
        _x +=340;
    }
}

//从相册中添加图片
-(void)addImage:(UIBarButtonItem *)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:NULL];
    [self updateImage];
}


//删除图片
-(void)deleImage:(UIBarButtonItem*)sender
{
    int x = _scrollView.contentOffset.x;
    int index = x/340;
   
    if (kPage==0) {
        [self updateImage];
        return;
    }
    [imageArray removeObjectAtIndex:index];
    [self updateImage];
     kPage--;
}

#pragma mark - ImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    kPage = kPage+1;
    _scrollView.contentSize = CGSizeMake(340*kPage, screenHight);
    int _x = _scrollView.contentSize.width-340;
    ImageScrollView *imageScrollView = [[[ImageScrollView alloc]initWithFrame:CGRectMake(_x, 0, 320, screenHight)] autorelease];
    imageScrollView.imageView.image = image;
    imageScrollView.tag = _scrollView.contentOffset.x/340;
    [_scrollView addSubview:imageScrollView];
    [imageArray addObject:imageScrollView];
     [self dismissViewControllerAnimated:YES completion:NULL];
    [_scrollView scrollRectToVisible:CGRectMake(_x, 0, 340, screenHight) animated:YES ];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark - ScrollView Delegate

int pre = 0;
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x/340;
    
    ImageScrollView *imageScrollView =(ImageScrollView*) [scrollView viewWithTag:pre];
    
    if(pre!=current && imageScrollView.zoomScale > 1.0)
    {
        imageScrollView.zoomScale = 1.0;
    }
    pre = current;
}



- (void)dealloc
{
    [_scrollView release];
    _scrollView = nil;
    [super dealloc];
}


//隐藏导航栏
-(void)hidNavigation
{
    [UIView beginAnimations:nil context:nil];
    [UIView  setAnimationDuration:0.5];
    if (self.navigationController.navigationBarHidden) {
   
        self.navigationController.navigationBarHidden = NO;
       
    }
    else{
        self.navigationController.navigationBarHidden = YES;
    }
     [UIView commitAnimations];
}


@end
