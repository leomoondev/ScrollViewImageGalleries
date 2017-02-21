//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Hyung Jip Moon on 2017-02-20.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *imageGalleryScrollView;
@property (strong, nonatomic) UIImageView *firstImageView;
@property (strong, nonatomic) UIImageView *secondImageView;
@property (strong, nonatomic) UIImageView *thirdImageView;

@property (nonatomic, strong) NSArray *storeImageViews;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageGalleryScrollView.delegate = self;

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
    
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];

    [self.imageGalleryScrollView addGestureRecognizer:self.tapGestureRecognizer];

    
}


- (void)tapped:(UITapGestureRecognizer*)tap {
    int currentPage = [self getCurrentPage];
    
    if (currentPage == 0) {
        [self performSegueWithIdentifier:@"hello" sender:self.storeImageViews[0]];
    }
    else if (currentPage == 1) {
        
        [self performSegueWithIdentifier:@"hello" sender:self.storeImageViews[1]];
    }
    else if (currentPage == 2) {
        [self performSegueWithIdentifier:@"hello" sender:self.storeImageViews[2]];
    }
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"hello"]) {
        ImageDetailViewController *details = (ImageDetailViewController *)segue.destinationViewController;
        details.detailViewImage = ((UIImageView*)sender).image;
        
    }
}

- (int) getCurrentPage {
    
    return self.imageGalleryScrollView.contentOffset.x / CGRectGetWidth(self.imageGalleryScrollView.frame);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = [self getCurrentPage];
}


@end
