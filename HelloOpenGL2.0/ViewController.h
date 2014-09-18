//
//  ViewController.h
//  HelloOpenGL2.0
//
//  Created by Mrshyi on 9/18/14.
//  Copyright (c) 2014 devshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenGLView.h"

@interface ViewController : UIViewController
{
    OpenGLView * _glView;
}
@property(strong, nonatomic) IBOutlet OpenGLView *glView;

@end

