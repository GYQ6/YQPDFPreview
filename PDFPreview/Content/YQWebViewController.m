//
//  YQWebViewController.m
//  PDFPreview
//
//  Created by GYQ on 2019/1/3.
//  Copyright © 2019年 gyq.com. All rights reserved.
//

#import "YQWebViewController.h"
#import <WebKit/WebKit.h>

@interface YQWebViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;


@end

@implementation YQWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configDataSource];
}

- (void)configDataSource {
    //加载本地
    //如果需要加载网络PDF文件 URL还成对应的路由
    NSURL *filePath = [NSURL URLWithString:TestPDFPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:filePath];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
