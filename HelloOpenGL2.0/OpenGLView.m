//
//  OpenGLView.m
//  HelloOpenGL2.0
//
//  Created by Mrshyi on 9/18/14.
//  Copyright (c) 2014 devshen. All rights reserved.
//

#import "OpenGLView.h"

@implementation OpenGLView
// 重写layerclass即可。创建一个用来显示OpenGL content的 视图，需要先设置视图默认的 layer 为 CAEAGLLayer。
+(Class)layerClass{
    return [CAEAGLLayer class];
}

// 默认，CALayer是透明的，需要设置为不透明
-(void)setupLayer{
    _eaglLayer = (CAEAGLLayer*)self.layer;
    _eaglLayer.opaque = YES;
}

// 创建OpenGL context
// 做任何有关OpenGL的事情，都需要创建一个 EAGLContext，并且设置当前context到新建的Context
// EAGLContext 管理所有iOS使用OpenGL绘制的所有信息。类似使用Core Graphics Context管理 core graphics
-(void)setupContext{
    // specify the version of api
    EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
    _context = [[EAGLContext alloc] initWithAPI:api];
    if (!_context) {
        NSLog(@"Failed to initialize OpenGLES 2.0 context");
        exit(1);
    }
    
    if (![EAGLContext setCurrentContext:_context]) {
        NSLog(@"Failed to set current OpenGL context");
        exit(1);
    }
}

// create render buffer,store the rendered image to present to the screen
-(void)setupRenderBuffer{
    // 创建 render buffer object
    glGenBuffers(1, &_colorRenderBuffer);
    // 绑定 GL_RENDERBUFFER 到 _colorRenderBuffer
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    // 存储Render Buffer
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:_eaglLayer];
}

-(void)setupFrameBuffer{
    // 创建framebuffer
    GLuint frameBuffer;
    glGenFramebuffers(1, &frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    // 让之前创建的renderbuffer 依附到 framebuffer的 GL_COLOR_ATTACHMENT0
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
}

// 清屏
-(void)render{
    // 设置颜色
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    // 清空
    glClear(GL_COLOR_BUFFER_BIT);
    // 显示
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
        [self setupContext];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        [self render];
    }
    return self;

}

-(void)dealloc{
    _context = nil;
}


















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
