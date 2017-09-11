//
//  UABuilder.m
//  NonWVApp-OBJC
//

#include <sys/utsname.h>
#include "UABuilder.h"

@implementation UABuilder

//eg. Darwin/16.3.0
static NSString * DarwinVersion(void) {
    struct utsname u;
    (void) uname(&u);
    return [NSString stringWithFormat:@"Darwin/%@", [NSString stringWithUTF8String:u.release]];
}

//eg. CFNetwork/808.3
static NSString * CFNetworkVersion(void) {
    return [NSString stringWithFormat:@"CFNetwork/%@", [NSBundle bundleWithIdentifier:@"com.apple.CFNetwork"].infoDictionary[@"CFBundleShortVersionString"]];
}

//eg. iOS/10_1
static NSString* deviceVersion()
{
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    
    return [NSString stringWithFormat:@"%@/%@", systemName, systemVersion];
}

//eg. iPhone5,2
static NSString* deviceName()
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithUTF8String:systemInfo.machine];
}

//eg. MyApp/1
static NSString* appNameAndVersion()
{
    NSString* appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString* appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@/%@", appName, appVersion];
}

/*static NSString* getUAString ()
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", appNameAndVersion(), deviceName(), deviceVersion(), CFNetworkVersion(), DarwinVersion()];
}*/

+ (NSString*)getUAString {
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", appNameAndVersion(), deviceName(), deviceVersion(), CFNetworkVersion(), DarwinVersion()];
}

@end
