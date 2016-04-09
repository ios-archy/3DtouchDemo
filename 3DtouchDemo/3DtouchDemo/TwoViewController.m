//
//  TwoViewController.m
//  3DtouchDemo
//
//  Created by yuqi on 16/4/8.
//  Copyright © 2016年 yuqi. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController   ()<UIWebViewDelegate,UIPreviewActionItem>
@property (nonatomic,strong )UIWebView *webView;
@end

@implementation TwoViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    [self.view addSubview:self.webView];
    NSURL *url =[NSURL URLWithString:@"http://www.jianshu.com/users/663e6f9b7f55/timeline"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}
//首先要遵守协议
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems NS_AVAILABLE_IOS(9_0)  //返回事件数组
{
    UIPreviewAction *action1 =[UIPreviewAction actionWithTitle:@"标记未读" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        //实现事件
        
    }];
    UIPreviewAction *action2 =[UIPreviewAction actionWithTitle:@"免打扰" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        
    }];
    
    UIPreviewAction *action3 =[UIPreviewAction actionWithTitle:@"置顶" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        
    }];
    UIPreviewAction *action4 =[UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        
    }];
    
    return @[action1,action2,action3,action4];
}

-(UIWebView *)webView
{
    if (!_webView) {
        _webView =[[UIWebView alloc]initWithFrame:self.view.frame];
        _webView.delegate =self;
    }
    return _webView;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    
}
@end
