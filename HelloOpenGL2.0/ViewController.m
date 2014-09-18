//
//  ViewController.m
//  HelloOpenGL2.0
//
//  Created by Mrshyi on 9/18/14.
//  Copyright (c) 2014 devshen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize glView = _glView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.glView = [[OpenGLView alloc] initWithFrame:screenBounds];
    [self.view addSubview:_glView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
