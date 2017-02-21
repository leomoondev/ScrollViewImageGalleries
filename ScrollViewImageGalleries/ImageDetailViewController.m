//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Hyung Jip Moon on 2017-02-20.
//  Copyright © 2017 leomoon. All rights reserved.
//

//#import "ImageDetailViewController.h"
//
//@interface ImageDetailViewController () <UIScrollViewDelegate>
//@property (strong, nonatomic) IBOutlet UIScrollView *imageDetailScrollView;
//
//@property (strong, nonatomic) UIImageView *firstImageView;
//
//
////@property UIImageView *imageDetailView;
//
//
//@end
//
//@implementation ImageDetailViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.imageDetailScrollView.delegate = self;
//    
//    // Do any additional setup after loading the view, typically from a nib.
//    self.firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
//
//    
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    
//    [self setupScrollViewForPaging];
////    [self viewForZoomingInScrollView:_imageDetailScrollView];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//- (void)setupScrollViewForPaging {
//    
//    CGFloat scrollViewWidth = CGRectGetWidth(self.imageDetailScrollView.frame);
//    CGFloat scrollViewHeight = CGRectGetHeight(self.imageDetailScrollView.frame);
//    
//    //create UIView for each image to hold all additional subviews
//    UIView *actualImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)];
//    
//    // Use for loop to go through an array of views and put them in UIView
//    
//        self.firstImageView.frame = CGRectMake(scrollViewWidth*0, 0, scrollViewWidth, scrollViewHeight);
//        [actualImageView addSubview:self.firstImageView];
//        
//        self.firstImageView.contentMode = UIViewContentModeScaleAspectFit;
//        [self.imageDetailScrollView addSubview:self.firstImageView];
//        
//
//    self.imageDetailScrollView.contentSize = CGSizeMake(0*scrollViewWidth, scrollViewHeight);
//    [self.imageDetailScrollView addSubview:actualImageView];
//    self.imageDetailScrollView.pagingEnabled = YES;
//    
//    self.imageDetailScrollView.maximumZoomScale = 5.0;
//    self.imageDetailScrollView.minimumZoomScale = 0.1;
//}
//
//
//
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)imageDetailScrollView {
//    
//    return self.firstImageView;
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)imageDetailScrollView {
//    
//    NSLog(@"Offset: %@", NSStringFromCGPoint(imageDetailScrollView.contentOffset));
//}
//
//
//
//@end

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageDetailScrollView;

@property (strong, nonatomic) UIImageView *imageView;



@end

@implementation ImageDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    self.imageDetailScrollView.delegate = self;
    
    //create content view to hold all additional subviews
    //    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    
    //allocate and initialze one imege view
    //    UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:]];
    //    self.imageView = oneImage;
    self.imageView = [[UIImageView alloc]init];
    //give a frame demension to the view
    self.imageView.frame = CGRectZero;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    //add imageView to scroll view
    [self.imageDetailScrollView addSubview:self.imageView];
    
    
    //constraint an image view to all side of scroll view
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.imageDetailScrollView.bottomAnchor].active = YES;
    [self.imageView.topAnchor constraintEqualToAnchor:self.imageDetailScrollView.topAnchor].active = YES;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.imageDetailScrollView.leftAnchor].active = YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.imageDetailScrollView.rightAnchor].active = YES;
    
    //specify the content view size
    //    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    
    self.imageDetailScrollView.maximumZoomScale = 10;
    self.imageDetailScrollView.minimumZoomScale = 0.5;
    
    self.imageView.image = self.detailViewImage;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
@end

