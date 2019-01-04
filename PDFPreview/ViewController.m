//
//  ViewController.m
//  PDFPreview
//
//  Created by GYQ on 2019/1/3.
//  Copyright © 2019年 gyq.com. All rights reserved.
//

#import "ViewController.h"
#import "YQTitleCell.h"
#import "YQWebViewController.h"
#import "YQQLPreviewController.h"
#import <QuickLook/QuickLook.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, QLPreviewControllerDataSource, QLPreviewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *titleArr; /**<数据源*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configSubUI];
}

- (void)configSubUI {
    self.navigationItem.title = @"两种方式";
    [_tableView registerNib:[UINib nibWithNibName:@"YQTitleCell" bundle:nil] forCellReuseIdentifier:@"YQTitleCell"];
}

- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [@[@"UIWebView",
                       @"QLPreviewController"
                       ] mutableCopy];
    }
    return _titleArr;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YQTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YQTitleCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.titleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        YQWebViewController *webVC = [YQWebViewController new];
        webVC.navigationItem.title = self.titleArr[indexPath.row];
        [self.navigationController pushViewController:webVC animated:YES];
    }else if (indexPath.row == 1) {
        QLPreviewController *previewVC = [QLPreviewController new];
        previewVC.delegate = self;
        previewVC.dataSource = self;
        [self.navigationController pushViewController:previewVC animated:YES];
    }else if (indexPath.row == 2) {
        
    }else {
        
    }
}

#pragma mark - QLPreviewControllerDelegate, QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    return [NSURL fileURLWithPath:TestPDFPath];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
