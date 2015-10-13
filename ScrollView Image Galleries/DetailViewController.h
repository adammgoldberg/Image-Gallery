//
//  DetailViewController.h
//  ScrollView Image Galleries
//
//  Created by Adam Goldberg on 2015-10-12.
//  Copyright (c) 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *myDetailViewController;


@property (nonatomic, strong) UIImageView *detailImage;

@property (nonatomic, assign) int imagenum;


@end
