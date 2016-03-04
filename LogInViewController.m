//
//  LogInViewController.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/3.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "LogInViewController.h"
#import "HYPDataSource.h"


@interface LogInViewController () <UIWebViewDelegate>

@property (nonatomic) NSURLSession *session;

@end

@implementation LogInViewController

- (instancetype)init{
    self = [super init];
    //初始化一个NSURLSession
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    }
    
    return self;
}

//视图加载完毕后，将webview加入视图层次结构
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];
    
}

//设置webview，并加入视图层次结构，完毕后使授权页面加载到webview里
- (void)loadWebView{
    UIWebView *tWebView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    tWebView.frame = self.view.bounds;
    tWebView.delegate = self;
    [self.view addSubview:tWebView];
    self.webView = tWebView;
    [self auther];
}


//在webview中加载授权页面
- (void)auther{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2406184446&redirect_uri=http://www.baidu.com/&response_type=code"]];
    [self.webView loadRequest:request];
    
}

//webview中的内容加载完毕后触发该方法去向服务器索取申请assesstoken所需的code
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString *urlString = webView.request.URL.absoluteString;
    
    NSLog(@"%@",urlString);
    
    NSRange range = [urlString rangeOfString:@"code="];
    
    if (range.length) {
        [self.webView removeFromSuperview];
        
        NSString *code = [urlString substringFromIndex:(range.location + range.length)];
        NSLog(@"%@",code);
        
        [self getTokenWithCode:code];
    }
}

//获取assesstoken，accesstouken的存放？

- (void)getTokenWithCode:(NSString *)code{
    NSString *reqString = @"https://api.weibo.com/oauth2/access_token";
    [reqString stringByAppendingString:code];
    NSURL *url = [NSURL URLWithString:reqString];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    
    [req setAllHTTPHeaderFields:nil];
    NSString *bodyStrTmp = @"client_id=2406184446&client_secret=f28d5dfc62120b5944e4393cd7191691&grant_type=authorization_code&redirect_uri=http://www.baidu.com/&code=";
    NSString *bodyStr = [bodyStrTmp stringByAppendingString:code];
    
    NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    [req setHTTPBody:bodyData];

    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString *accessToken = [jsonObject valueForKey:@"access_token"];
        self.token = accessToken;
        NSLog(@"%@",self.token);
        [[NSUserDefaults standardUserDefaults] setObject:self.token forKey:@"token"];
        NSLog(@"login token: %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]);
    }];
    
    [dataTask resume];
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

- (BOOL)hidesBottomBarWhenPushed{
    return YES;
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
