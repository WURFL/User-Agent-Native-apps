//
//  ViewController.m
//  NonWVApp-OBJC
//

#import "ViewController.h"
#import "UABuilder.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"NONWVApp-OBJC";
    
    NSString* userAgent = [UABuilder getUAString];
    NSURL* url = [NSURL URLWithString:@"https://www.scientiamobile.com/page/wp-content/uploads/2017/02/HomePage-Demo-Woman-iPad-Redov3.png"];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
    UIImage *img = [[UIImage alloc] initWithData:data];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    imageview.image=img;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageview];
    
    NSLog(@"%@", [UABuilder getUAString]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
