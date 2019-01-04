//
//  YQQLPreviewController.m
//  PDFPreview
//
//  Created by GYQ on 2019/1/3.
//  Copyright © 2019年 gyq.com. All rights reserved.
//

#import "YQQLPreviewController.h"
#import <QuickLook/QuickLook.h>

@interface YQQLPreviewController ()<QLPreviewControllerDelegate, QLPreviewControllerDataSource>
@property (strong, nonatomic) QLPreviewController *previewVC; /**<浏览器*/

@end

@implementation YQQLPreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configSubView];
}

- (void)configSubView {
    self.view.backgroundColor = [UIColor whiteColor];
    
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
