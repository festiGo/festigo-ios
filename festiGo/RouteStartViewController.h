//
//  RouteStartViewController.h
//  ScavengerApp
//
//  Created by Giovanni Maggini on 5/15/13.
//  Copyright (c) 2013 Code for Europe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompassViewController.h"
#import "GAITrackedViewController.h"

@interface RouteStartViewController : UITableViewController<CompassViewControllerDelegate, UIAlertViewDelegate>
{
    BOOL showRewardOnAppear;
}

@end
