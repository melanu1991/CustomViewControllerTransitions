#import <UIKit/UIKit.h>

@interface CustomInteractionController : UIPercentDrivenInteractiveTransition

@property (assign, nonatomic, getter = isInteractionInProgress) BOOL interactionInProgress;

- (void)wireToViewController:(UIViewController *)viewController;

@end
