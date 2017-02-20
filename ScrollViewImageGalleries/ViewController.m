//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Hyung Jip Moon on 2017-02-20.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *imageGalleryScrollView;
@property (strong, nonatomic) UIImageView *firstImageView;
@property (strong, nonatomic) UIImageView *secondImageView;
@property (strong, nonatomic) UIImageView *thirdImageView;

@property (nonatomic, strong) NSArray *storeImageViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.imageGalleryScrollView.delegate = self;

    // Do any additional setup after loading the view, typically from a nib.
    self.firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    self.secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    self.thirdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];

    self.storeImageViews = @[self.firstImageView, self.secondImageView, self.thirdImageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setupScrollViewForPaging];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupScrollViewForPaging {
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.imageGalleryScrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.imageGalleryScrollView.frame);
    
    //create UIView for each image to hold all additional subviews
    UIView *actualImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.imageGalleryScrollView.frame), CGRectGetHeight(self.imageGalleryScrollView.frame))];
    
    // Use for loop to go through an array of views and put them in UIView
    int i = 0;
    for (UIImageView * imageView in self.storeImageViews) {
        
        imageView.frame = CGRectMake(scrollViewWidth*i, 0, scrollViewWidth, scrollViewHeight);
        [actualImageView addSubview:imageView];

        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageGalleryScrollView addSubview:imageView];

        ++i;
    }
    self.imageGalleryScrollView.contentSize = CGSizeMake(i*scrollViewWidth, scrollViewHeight);
    [self.imageGalleryScrollView addSubview:actualImageView];
    self.imageGalleryScrollView.pagingEnabled = YES;
}

@end
