//
//  HomeViewController.m
//  HotFixDemo
//
//  Created by wzx on 2017/12/19.
//  Copyright © 2017年 topcheer. All rights reserved.
//

#import "HomeViewController.h"
#import "JPEngine.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setupFunction];
}

//方法注入口，只做添加
-(void)setupFunction{
    //just add function name
//    [self addButton];
}


- (IBAction)btnFun1:(id)sender {
    [self excuteDownload:@"http://sso.topcheer.com:5000/hotfix/addbtn.js"];
}
- (IBAction)btnFun2:(id)sender {
}
- (IBAction)btnFun3:(id)sender {
}
- (IBAction)btnFun4:(id)sender {
}

-(void)addButton{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [btn setTitle:@"这是一个新增的按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}


-(void)excuteDownload:(NSString *)urlStr{
    
    if(![urlStr isEqualToString:@""]){
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDownloadTask *task = [session downloadTaskWithURL:[NSURL URLWithString:urlStr ] completionHandler:^(NSURL * _Nullable location,NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"location: %@", location);
        
            // 下载任务会把下载的资源存放到临时文件夹tmp下. block结束后, 就会自动删除.
            //document路径
            NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
            NSString *fileName=[urlStr lastPathComponent];
            NSString *path = [docPath stringByAppendingPathComponent:fileName];
            NSLog(@"path: %@", path);// 拷贝路径在 Finder ->前往 ->前往文件夹 可看到已下载文件
        
            // 测试了会有缓存, 且不能把原有的 JS 文件覆盖, 故要先移除
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
            }
            // 故把下载数据移动到document下
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:path]error:nil];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [JPEngine startEngine];
                [JPEngine evaluateScriptWithPath:path];
            }];
            if (error) {
                NSLog(@"error descript:%@",error.description);
            }
        }];
        [task resume];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
