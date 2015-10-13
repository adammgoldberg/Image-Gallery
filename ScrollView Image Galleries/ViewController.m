//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Adam Goldberg on 2015-10-12.
//  Copyright (c) 2015 Adam Goldberg. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getDetails:)];
    
    
    
    [self.scrollView addGestureRecognizer:tap];
    
    
   
    

    
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int picnum = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = picnum;
}

-(void)getDetails:(UITapGestureRecognizer*)sender
{
    [self performSegueWithIdentifier:@"showImageDetail" sender:self];
    
    
////If I didn't have a storyboard, I can segue programatically using these commands:
//    [random examples:]
//    for storyboard:
//    [self performSegueWithIdentifier:stringparam sender:idparam]
//    random example
//    for [viewcontrollers programmatically:]
//    [self presentViewController:randomViewController animated:YES completion:nil];
//    [self.navigationController pushViewController:vcparam animated:boolparam];
//    note - navcontrollers push, viewcontrollers present (generally speaking)
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showImageDetail"]) {
        int picnum = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
        DetailViewController *dvc = segue.destinationViewController;
        dvc.imagenum = picnum;
        }

}

-(void)viewDidLayoutSubviews {
   
    
    
    
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    
    image1.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    image2.frame = CGRectMake(CGRectGetMaxX(image1.frame), self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    image3.frame = CGRectMake(CGRectGetMaxX(image2.frame), self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
   
    
    
    CGFloat combinedWidth = CGRectGetWidth(image1.frame) + CGRectGetWidth(image2.frame) + CGRectGetWidth(image3.frame);
    
    self.scrollView.contentSize = CGSizeMake(combinedWidth, CGRectGetHeight(image1.frame));
    
    [self.scrollView addSubview:image1];
    [self.scrollView addSubview:image2];
    [self.scrollView addSubview:image3];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
