//
//  RootViewController.m
//  UIscrollPhotoDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "RootViewController.h"
#import "ImageScrollView.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = NO;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 340, 480)];
    _scrollView.contentSize = CGSizeMake(340*kPage, 480);
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.tag = INT16_MAX;
    
    //设置代理
    _scrollView.delegate = self;
    
    //加载图片
    ImageScrollView *imageScrollView = [[[ImageScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
    NSString *imageName  = [NSString stringWithFormat:@"%d.png",1];
    imageScrollView.imageView.image = [UIImage imageNamed:imageName];
    imageScrollView.tag = 0;
    [imageArray addObject:imageScrollView];
    
    //加载图片
    [self updateImage];
    
    //添加图片
    UIBarButtonItem *addImageButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addImage:)];
    
    UIBarButtonItem *blockButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:NULL action:NULL];
    
    //删除图片
    UIBarButtonItem *deleImageButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(deleImage:)];
    self.toolbarItems = @[addImageButton,blockButton,deleImageButton];

    [self.view addSubview:_scrollView];
    // Do any additional setup after loading the view.
}

//
//  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//{
//    NSLog(@"%@",error);
//}

//更新显示视图
-(void)updateImage
{
    NSLog(@"%d",[imageArray count]);
    int _x = 0;
    
    //删除子视图
    for (UIView * subview in [_scrollView subviews]) {
        if([subview isKindOfClass:[UIImageView class]]) continue;//这是为了防止滚动条被移除;
        [subview removeFromSuperview];
    }
    //重新加载子视图
     _scrollView.contentSize = CGSizeMake(340*kPage, 480);
    for (int index = 0; index < [imageArray count]; index++) {
        ImageScrollView *imageScrollView2 = [imageArray objectAtIndex:index];
        imageScrollView2.frame = CGRectMake(_x, 0, 320, 480);
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
        
        //提示已经没有图片。
        UILabel *label = [[UILabel alloc]init];
        label.text = @"没有图片";
        label.textAlignment = NSTextAlignmentCenter;
        [_scrollView addSubview:label];
        [label release];
        return;
    }
    [imageArray removeObjectAtIndex:index];
    kPage--;
    [self updateImage];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    kPage = kPage+1;
    _scrollView.contentSize = CGSizeMake(340*kPage, 480);
    int _x = _scrollView.contentSize.width-340;
    ImageScrollView *imageScrollView = [[[ImageScrollView alloc]initWithFrame:CGRectMake(_x, 0, 320, 480)] autorelease];
    imageScrollView.imageView.image = image;
    imageScrollView.tag = _scrollView.contentOffset.x/340;
    [_scrollView addSubview:imageScrollView];
    [imageArray addObject:imageScrollView];
     [self dismissViewControllerAnimated:YES completion:NULL];
    [_scrollView scrollRectToVisible:CGRectMake(_x, 0, 340, 480) animated:YES ];
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
