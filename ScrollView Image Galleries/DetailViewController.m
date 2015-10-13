//
//  DetailViewController.m
//  ScrollView Image Galleries
//
//  Created by Adam Goldberg on 2015-10-12.
//  Copyright (c) 2015 Adam Goldberg. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()




@end


@implementation DetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.myDetailViewController.delegate = self;
    
    self.detailImage = [[UIImageView alloc] init];
    self.detailImage.frame = self.myDetailViewController.frame;
    if (self.imagenum == 0) {
        self.detailImage.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    } else if (self.imagenum == 1) {
        self.detailImage.image = [UIImage imageNamed:@"Lighthouse-night"];
    } else if (self.imagenum == 2) {
        self.detailImage.image = [UIImage imageNamed:@"Lighthouse-zoomed"];
    }
    
    
                                  

    [self.myDetailViewController addSubview:self.detailImage];
    
    
    self.myDetailViewController.maximumZoomScale = 2.0;
    self.myDetailViewController.minimumZoomScale = 0.5;
        
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.detailImage;
}


@end
