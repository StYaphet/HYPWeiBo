//
//  LogInViewController.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/3.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "LogInViewController.h"
#import "HYPDataSource.h"
#import "HYPAccount.h"
#import "HYPAccountList.h"


@interface LogInViewController () <UIWebViewDelegate>

{
    UIWebView *_webView;
}

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

//设置视图层次结构
- (void)loadView{
    [super loadView];
    _webView = [[UIWebView alloc] init];
    self.view = _webView;
    
}

//设置webview，并加入视图层次结构，完毕后使授权页面加载到webview里
- (void)viewDidLoad{
    [super viewDidLoad];
    
    _webView.delegate = self;
    
    [self addAutherView];
}


//在webview中加载授权页面
- (void)addAutherView{
    [self.navigationController setNavigationBarHidden:YES];
    NSURLRequest *oauthURL = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2406184446&redirect_uri=http://www.baidu.com/&response_type=code"]];
    [_webView loadRequest:oauthURL];
    
}


#pragma mark - 代理方法
//webview中的内容加载完毕后触发该方法去向服务器索取申请assesstoken所需的code
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString *urlString = webView.request.URL.absoluteString;
    
    if (![urlString  isEqual: @"https://api.weibo.com/oauth2/authorize?client_id=2406184446&redirect_uri=http://www.baidu.com/&response_type=code"]) {
        
        [self.navigationController setNavigationBarHidden:NO];
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回授权界面" style:UIBarButtonItemStylePlain target:self action:@selector(addAutherView)];
        self.navigationItem.leftBarButtonItem = back;
    }else{
        [self.navigationController setNavigationBarHidden:YES];
    }
    
    NSLog(@"%@",urlString);
    
    NSRange range = [urlString rangeOfString:@"code="];
    
    if (range.length) {
        self.view.hidden = YES;
        
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
        NSString *token = [jsonObject objectForKey:@"access_token"];
        NSString *uid = [jsonObject objectForKey:@"uid"];
        NSString *expiresIn = [jsonObject objectForKey:@"expiresIn"];
        HYPAccount *account = [[HYPAccount alloc] initWithToken:token uid:uid expiresIn:expiresIn];
        
        [HYPAccountList savaAcountsWithAccount:account];
        
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
